-- | Integration with generator adapters that conform to the standard of version 1.
module PGenieGen.V1
  ( Input,
    Result (..),
    SuccessResult (..),
    Warning (..),
    UnsupportedType (..),
    File (..),
    Location (..),
    load,
  )
where

import Data.Aeson qualified as Aeson
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Src qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.ExprAccessors qualified as ExprAccessors
import PGenieGen.Prelude
import PGenieGen.V1.Project qualified as Project

type Input = Project.Project

data Result
  = ResultFailure Text
  | ResultSuccess SuccessResult
  deriving stock (Generic, Show, Eq)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "Result") Result)

data SuccessResult
  = SuccessResult
  { warnings :: [Warning],
    files :: [File]
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

data Warning
  = WarningUnsupportedType UnsupportedType
  | WarningOther Text
  deriving stock (Generic, Show, Eq)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "Warning") Warning)

data UnsupportedType = UnsupportedType
  { value :: Project.Value,
    query :: Project.Query
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

data File = File
  { path :: Text,
    content :: Text
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

type DhallExpr = Dhall.Core.Expr Dhall.Src.Src Void

-- * Procedures

data Location
  = LocationUrl Text
  | LocationPath Text

load :: Location -> Aeson.Value -> IO (Input -> Result)
load location configJson = do
  let code = case location of
        LocationUrl url -> url <> "/Gen.dhall"
        LocationPath path -> "./" <> path <> "/Gen.dhall"

  putStrLn ("Loading generator code from: " <> to code)

  genExpr <- Dhall.inputExpr code

  configTypeExpr <- case ExprAccessors.recordField "Config" genExpr of
    Nothing -> do
      putStrLn "Could not find 'Config' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  configValExpr <- case Dhall.FromJson.dhallFromJSON Dhall.FromJson.defaultConversion configTypeExpr configJson of
    Left err -> do
      putStrLn ("Config does not conform to the expected schema:\n" <> show err)
      exitFailure
    Right configVal -> pure configVal

  compileExpr <- case ExprAccessors.recordField "compile" genExpr of
    Nothing -> do
      putStrLn "Could not find 'compile' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  let configEncoder =
        Dhall.Encoder
          { embed = const configValExpr,
            declared = configTypeExpr
          }
      decoder =
        fmap
          ($ ())
          ( Dhall.function
              configEncoder
              Dhall.auto
          )

  Dhall.expectWithSettings Dhall.defaultInputSettings decoder compileExpr

  Dhall.rawInput decoder compileExpr
