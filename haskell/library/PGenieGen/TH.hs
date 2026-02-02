module PGenieGen.TH where

import AlgebraicPath qualified as Path
import Data.Aeson qualified as Aeson
import Data.Text.IO qualified as Text.IO
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Pretty qualified
import Dhall.TH qualified
import Language.Haskell.TH.Syntax qualified as TH
import PGenieGen.Contract qualified as Contract
import PGenieGen.Dhall.ExprViews qualified as ExprViews
import PGenieGen.Input qualified as Input
import PGenieGen.Output qualified as Output
import PGenieGen.Prelude

data Location
  = LocationUrl Text
  | LocationPath Path

-- | Executes a Dhall expression at compile time and constructs a Haskell value at compile time.
compiler ::
  Location ->
  TH.Code TH.Q (Aeson.Value -> Either Text (Input.Project -> Output.Output))
compiler location = TH.Code do
  let code = case location of
        LocationUrl url -> url <> "/Gen.dhall"
        LocationPath path -> Path.toText (path <> "Gen.dhall")

  (configTypeExpr, compileExpr) <- TH.runIO do
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

    compileExpr <- case ExprViews.recordField "compile" genExpr of
      Nothing -> do
        putStrLn "Could not find 'compile' field in the loaded generator code"
        exitFailure
      Just expr -> pure expr

    pure (configTypeExpr, compileExpr)

  TH.examineCode
    [||
    \configJson ->
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
    ||]
