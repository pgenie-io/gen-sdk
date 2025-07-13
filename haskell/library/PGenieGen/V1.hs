-- | Integration with generator adapters that conform to the standard of version 1.
module PGenieGen.V1 where

import Data.Aeson qualified as Aeson
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Src qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
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
  { path :: FilePath,
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
  configSig <- loadConfigSig location
  configEncoder <- loadConfig configSig configJson
  loadGen location configEncoder

loadConfigSig :: Location -> IO DhallExpr
loadConfigSig location =
  Dhall.inputExpr code
  where
    code = case location of
      LocationUrl url -> url <> "/Config.dhall"
      LocationPath path -> path <> "/Config.dhall"

loadConfig :: DhallExpr -> Aeson.Value -> IO (Dhall.Encoder ())
loadConfig configSig json = do
  case Dhall.FromJson.dhallFromJSON Dhall.FromJson.defaultConversion configSig json of
    Left err -> throwIO $ userError $ "Failed to load config: " <> show err
    Right configVal ->
      pure
        Dhall.Encoder
          { embed = const configVal,
            declared = configSig
          }

loadGen :: Location -> Dhall.Encoder () -> IO (Input -> Result)
loadGen location configEncoder =
  Dhall.input decoder code
  where
    code =
      "(let Gen = " <> importCode <> " in Gen.generate)"
      where
        importCode = case location of
          LocationUrl url -> url <> "/Gen.dhall"
          LocationPath path -> path <> "/Gen.dhall"
    decoder =
      Dhall.function configEncoder Dhall.auto
        & fmap ($ ())
