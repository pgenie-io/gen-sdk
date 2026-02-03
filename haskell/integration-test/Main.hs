module Main (main) where

import Data.Aeson qualified as Aeson
import Data.Aeson.QQ.Simple (aesonQQ)
import Data.Text.IO qualified as Text
import PGenieGen qualified as PGenieGen
import PGenieGen.Fixtures.Project1 qualified as Fixtures.Project1
import PGenieGen.Model.Output qualified as Output
import PGenieGen.Model.Output.Report qualified as Output.Report
import System.Exit
import Test.Hspec
import Prelude

main :: IO ()
main = hspec do
  describe "" do
    it "" do
      compile <-
        PGenieGen.load location configJson

      let output =
            compile Fixtures.Project1.input

      files <-
        case output.result of
          Nothing -> do
            putStrLn "Generation failed!"
            forM_ output.reports \report -> do
              Text.putStrLn (Output.Report.toErrorYamlText report)
            exitFailure
          Just files -> do
            putStrLn "Generation succeeded!"
            forM_ output.reports \report -> do
              Text.putStrLn (Output.Report.toWarningYamlText report)

            pure files

      shouldBe
        files
        [ Output.File
            { path = "output.yaml",
              content =
                "config:\n\
                \  foo: Foo!\n\
                \  bar: null\n"
            }
        ]

location :: PGenieGen.Location
location = PGenieGen.LocationPath "./integration-test"

configJson :: Aeson.Value
configJson =
  [aesonQQ| 
    {
      "foo": "Foo!"
    } 
  |]
