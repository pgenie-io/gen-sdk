{-# LANGUAGE AllowAmbiguousTypes #-}

module Main (main) where

import Data.Either.Validation qualified as Validation
import Data.Set qualified as Set
import Dhall qualified
import Dhall.Core qualified
import Dhall.Map qualified
import PGenieGen.Model.Input qualified as Input
import Test.Hspec
import Prelude

main :: IO ()
main = hspec do
  describe "Dhall/Haskell model compatibility" do
    it "Primitive union alternatives match" $
      checkUnionAlternatives @Input.Primitive
        "(../dhall/Project.dhall).Primitive"

    it "Scalar union alternatives match" $
      checkUnionAlternatives @Input.Scalar
        "(../dhall/Project.dhall).Scalar"

    it "CustomTypeDefinition union alternatives match" $
      checkUnionAlternatives @Input.CustomTypeDefinition
        "(../dhall/Project.dhall).CustomTypeDefinition"

    it "ResultRowsCardinality union alternatives match" $
      checkUnionAlternatives @Input.ResultRowsCardinality
        "(../dhall/Project.dhall).ResultRowsCardinality"

    it "QueryFragment union alternatives match" $
      checkUnionAlternatives @Input.QueryFragment
        "(../dhall/Project.dhall).QueryFragment"

-- | Assert that a Dhall type expression and a Haskell 'Decoder' describe the
-- same set of union alternatives.  For non-union types the comparison falls
-- back to checking that both sides produce an empty set, which will pass
-- trivially; add dedicated record-field tests if broader coverage is needed.
checkUnionAlternatives :: forall a. Dhall.FromDhall a => Text -> IO ()
checkUnionAlternatives dhallExpr = do
  actual <- Dhall.inputExpr dhallExpr
  case Dhall.expected (Dhall.auto @a) of
    Validation.Failure errs ->
      expectationFailure ("Haskell Decoder has invalid expected type: " ++ show errs)
    Validation.Success expr -> do
      let dhallAlts = unionAlternatives actual
      let hsAlts = unionAlternatives expr
      dhallAlts `shouldBe` hsAlts

-- | Extract the set of alternative names from a Dhall union type expression.
unionAlternatives :: Dhall.Core.Expr s a -> Set Text
unionAlternatives = \case
  Dhall.Core.Union alts -> Set.fromList (Dhall.Map.keys alts)
  _ -> Set.empty
