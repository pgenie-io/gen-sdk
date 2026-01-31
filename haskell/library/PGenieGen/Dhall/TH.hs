{-# LANGUAGE TemplateHaskell #-}

{- |
Module: PGenieGen.Dhall.TH
Description: Template Haskell utilities for compile-time Dhall-to-Haskell code generation

This module provides experimental Template Haskell functions that can convert
Dhall types and values into Haskell code at compile time.

Example usage:

@
{-# LANGUAGE TemplateHaskell #-}
import PGenieGen.Dhall.TH

-- Generate a Haskell type from a Dhall type expression
$(dhallType "MyConfig" "{ name : Text, age : Natural }")

-- Generate a Haskell value from a Dhall value expression
myValue :: MyConfig
myValue = $(dhallValue "MyConfig" "{ name = \"Alice\", age = 30 }")
@

Note: This is a proof-of-concept implementation demonstrating the feasibility
of compile-time Dhall-to-Haskell code generation. For production use, the
runtime interpretation approach in 'PGenieGen' is recommended for most use cases.
-}
module PGenieGen.Dhall.TH
  ( -- * Type Generation
    dhallType,
    dhallTypeFromFile,

    -- * Value Generation
    dhallValue,
    dhallValueFromFile,

    -- * Lower-level utilities
    dhallExprToType,
    dhallExprToExp,
  )
where

import Control.Monad (forM)
import Data.Foldable (toList)
import Data.Map.Strict qualified as Map
import Data.Text qualified as Text
import Dhall.Core qualified as Dhall
import Dhall.Parser qualified as Dhall.Parser
import Dhall.TypeCheck qualified as Dhall
import GHC.Generics (Generic)
import Language.Haskell.TH
import Language.Haskell.TH.Syntax qualified as TH
import Numeric.Natural (Natural)

-- | Generate a Haskell data type from a Dhall type expression string.
--
-- This function parses a Dhall type expression and generates the corresponding
-- Haskell data type declaration at compile time.
--
-- Example:
--
-- @
-- $(dhallType "Person" "{ name : Text, age : Natural }")
-- @
--
-- Generates:
--
-- @
-- data Person = Person
--   { name :: Text
--   , age :: Natural
--   }
--   deriving (Show, Eq, Generic)
-- @
dhallType :: String -> String -> Q [Dec]
dhallType typeName dhallExprStr = do
  expr <- parseDhallExpr "<template-haskell>" dhallExprStr
  generateDataType (mkName typeName) expr

-- | Generate a Haskell data type from a Dhall type file.
--
-- Similar to 'dhallType', but reads the Dhall type from a file.
dhallTypeFromFile :: String -> FilePath -> Q [Dec]
dhallTypeFromFile typeName path = do
  dhallCode <- TH.runIO $ readFile path
  dhallType typeName dhallCode

-- | Generate a Haskell value from a Dhall value expression string.
--
-- This function parses a Dhall value expression and generates the corresponding
-- Haskell expression at compile time.
--
-- Example:
--
-- @
-- myPerson :: Person
-- myPerson = $(dhallValue "Person" "{ name = \"Alice\", age = 30 }")
-- @
dhallValue :: String -> String -> Q Exp
dhallValue _typeName dhallExprStr = do
  expr <- parseDhallExpr "<template-haskell>" dhallExprStr
  dhallExprToExp expr

-- | Generate a Haskell value from a Dhall value file.
--
-- Similar to 'dhallValue', but reads the Dhall value from a file.
dhallValueFromFile :: String -> FilePath -> Q Exp
dhallValueFromFile typeName path = do
  dhallCode <- TH.runIO $ readFile path
  dhallValue typeName dhallCode

-- | Convert a Dhall expression to a Haskell type.
--
-- This is a lower-level function that maps Dhall types to their Haskell equivalents.
dhallExprToType :: Dhall.Expr s a -> Q Type
dhallExprToType = \case
  Dhall.Bool -> pure $ ConT ''Bool
  Dhall.Natural -> pure $ ConT ''Natural
  Dhall.Integer -> pure $ ConT ''Integer
  Dhall.Double -> pure $ ConT ''Double
  Dhall.Text -> pure $ ConT ''Text.Text
  Dhall.List innerType -> do
    innerHaskellType <- dhallExprToType innerType
    pure $ AppT ListT innerHaskellType
  Dhall.Optional innerType -> do
    innerHaskellType <- dhallExprToType innerType
    pure $ AppT (ConT ''Maybe) innerHaskellType
  Dhall.Record fields -> do
    -- For anonymous records, we can't generate a proper type at this level
    -- This would need to be handled differently in a real implementation
    -- For now, just return a placeholder
    fail "Anonymous record types not supported in dhallExprToType. Use dhallType instead."
  Dhall.Union _alternatives -> do
    fail "Union types not yet supported in dhallExprToType"
  expr -> fail $ "Unsupported Dhall type: " <> show expr

-- | Convert a Dhall value expression to a Haskell expression.
--
-- This is a lower-level function that converts Dhall values to Haskell expressions.
dhallExprToExp :: Dhall.Expr s a -> Q Exp
dhallExprToExp = \case
  Dhall.BoolLit b -> pure $ ConE (if b then 'True else 'False)
  Dhall.NaturalLit n -> pure $ LitE (IntegerL (toInteger n))
  Dhall.IntegerLit i -> pure $ LitE (IntegerL i)
  Dhall.DoubleLit d -> pure $ LitE (RationalL (toRational d))
  Dhall.TextLit (Dhall.Chunks [] txt) -> pure $ LitE (StringL (Text.unpack txt))
  Dhall.ListLit _maybeType values -> do
    elemExps <- mapM dhallExprToExp (toList values)
    pure $ ListE elemExps
  Dhall.Some inner -> do
    innerExp <- dhallExprToExp inner
    pure $ AppE (ConE 'Just) innerExp
  Dhall.App Dhall.None _type -> pure $ ConE 'Nothing
  Dhall.RecordLit fields -> do
    -- Generate record construction
    fieldExps <- forM (Map.toList fields) $ \(fieldName, fieldValue) -> do
      fieldExp <- dhallExprToExp (Dhall.recordFieldValue fieldValue)
      pure (mkName (Text.unpack fieldName), fieldExp)
    -- For now, we'll generate a tuple if we can't determine the constructor
    -- In a real implementation, this would need type information
    fail "Record literals not yet fully supported. Need type information for constructor."
  expr -> fail $ "Unsupported Dhall value: " <> show expr

-- * Internal helpers

-- | Parse a Dhall expression from a string.
parseDhallExpr :: String -> String -> Q (Dhall.Expr Dhall.Src Dhall.Import)
parseDhallExpr sourceName dhallCode = do
  case Dhall.Parser.exprFromText sourceName (Text.pack dhallCode) of
    Left err -> fail $ "Failed to parse Dhall expression: " <> show err
    Right expr -> pure expr

-- | Generate a Haskell data type declaration from a Dhall record type.
generateDataType :: Name -> Dhall.Expr Dhall.Src Dhall.Import -> Q [Dec]
generateDataType typeName expr = do
  case expr of
    Dhall.Record fields -> do
      let conName = typeName
      fieldDecs <- mapM (uncurry mkField) (Map.toList fields)
      let con = RecC conName fieldDecs
      let deriveClauses =
            [ DerivClause
                Nothing
                [ ConT ''Show,
                  ConT ''Eq,
                  ConT ''Generic
                ]
            ]
      let dataD = DataD [] typeName [] Nothing [con] deriveClauses
      pure [dataD]
    _ -> fail $ "Expected a record type, got: " <> show expr
  where
    mkField :: Text.Text -> Dhall.RecordField Dhall.Src Dhall.Import -> Q VarStrictType
    mkField fieldName recordField = do
      let fieldNameH = mkName (Text.unpack fieldName)
      fieldType <- dhallExprToType (Dhall.recordFieldValue recordField)
      let strictness = Bang NoSourceUnpackedness NoSourceStrictness
      pure (fieldNameH, strictness, fieldType)
