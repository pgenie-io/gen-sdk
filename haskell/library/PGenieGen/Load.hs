module PGenieGen.Load where

import Dhall qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import PGenieGen.Contract qualified as Contract
import PGenieGen.Dhall.ExprViews qualified as ExprViews
import PGenieGen.Location qualified as Location
import PGenieGen.Model
import PGenieGen.Prelude

-- * Procedures

load :: Location.Location -> (Text -> IO ()) -> IO Gen
load location echo = do
  let code = Location.toCode location

  echo ("Loading generator code from: " <> to code)

  genExpr <- Dhall.inputExpr code

  contractVersionExpr <- case ExprViews.recordField "contractVersion" genExpr of
    Nothing -> do
      echo "Could not find 'contractVersion' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  Contract.ContractVersion major minor <- do
    let decoder = Dhall.auto @Contract.ContractVersion

    Dhall.expectWithSettings Dhall.defaultInputSettings decoder contractVersionExpr

    Dhall.rawInput decoder contractVersionExpr

  when (major /= 1) do
    echo ("Incompatible contract major version: " <> onto (show major) <> ". Expected 1.")
    exitFailure

  when (minor > 0) do
    echo ("Incompatible contract minor version: " <> onto (show minor) <> ". Expected 0 or lower.")
    exitFailure

  configTypeExpr <- case ExprViews.recordField "Config" genExpr of
    Nothing -> do
      echo "Could not find 'Config' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  compileExpr <- case ExprViews.recordField "compile" genExpr of
    Nothing -> do
      echo "Could not find 'compile' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  pure \configJson ->
    case Dhall.FromJson.dhallFromJSON Dhall.FromJson.defaultConversion configTypeExpr configJson of
      Left err -> do
        Left ("Config does not conform to the expected schema:\n" <> onto (show err))
      Right configValExpr ->
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
         in case Dhall.rawInput decoder compileExpr of
              Nothing -> Left "Failed to decode the 'compile' function from the generator code."
              Just compileFunc -> Right compileFunc
