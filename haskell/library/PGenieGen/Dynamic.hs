module PGenieGen.Dynamic where

import AlgebraicPath qualified as Path
import Data.Aeson qualified as Aeson
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Src qualified
import PGenieGen.Contract qualified as Contract
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.ExprViews qualified as ExprViews
import PGenieGen.Location qualified as Location
import PGenieGen.Model
import PGenieGen.Model.Input qualified as Project
import PGenieGen.Model.Output qualified as Output
import PGenieGen.Prelude

-- * Procedures

loadDynamically :: Location.Location -> Aeson.Value -> IO (Input -> Output)
loadDynamically location configJson = do
  let code = Location.toCode location

  putStrLn ("Loading generator code from: " <> to code)

  genExpr <- Dhall.inputExpr code

  contractVersionExpr <- case ExprViews.recordField "contractVersion" genExpr of
    Nothing -> do
      putStrLn "Could not find 'contractVersion' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  Contract.ContractVersion major minor <- do
    let decoder = Dhall.auto @Contract.ContractVersion

    Dhall.expectWithSettings Dhall.defaultInputSettings decoder contractVersionExpr

    Dhall.rawInput decoder contractVersionExpr

  when (major /= 1) do
    putStrLn ("Incompatible contract major version: " <> show major <> ". Expected 1.")
    exitFailure

  when (minor > 0) do
    putStrLn ("Incompatible contract minor version: " <> show minor <> ". Expected 0 or lower.")
    exitFailure

  configTypeExpr <- case ExprViews.recordField "Config" genExpr of
    Nothing -> do
      putStrLn "Could not find 'Config' field in the loaded generator code"
      exitFailure
    Just expr -> pure expr

  configValExpr <- case Dhall.FromJson.dhallFromJSON Dhall.FromJson.defaultConversion configTypeExpr configJson of
    Left err -> do
      putStrLn ("Config does not conform to the expected schema:\n" <> show err)
      exitFailure
    Right configVal -> pure configVal

  compileExpr <- case ExprViews.recordField "compile" genExpr of
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
