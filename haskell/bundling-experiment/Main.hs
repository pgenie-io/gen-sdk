module Main (main) where

import Control.Monad (forM_)
import Data.Aeson qualified as Aeson
import Data.Aeson.QQ.Simple (aesonQQ)
import Data.List.NonEmpty qualified as NonEmpty
import Data.Text (Text)
import Data.Text.IO qualified as Text.IO
import Dhall.Core qualified
import Dhall.Pretty qualified
import Dhall.TH qualified
import LawfulConversions
import PGenieGen qualified as PGenieGen
import PGenieGen.Input qualified as Input
import PGenieGen.Output qualified as Output
import PGenieGen.Output.Report qualified as Output.Report
import PGenieGen.TH qualified
import Prettyprinter qualified as Pp
import Prettyprinter.Render.Text qualified as Pp
import System.Exit
import Test.Hspec
import TextBuilder qualified
import PGenieGen.Fixtures.Project1 qualified as Fixtures.Project1
import Prelude

main :: IO ()
main = do
  fn <- case compiler configJson of
    Left err -> do
      putStrLn ("Compilation failed: " <> to err)
      exitFailure
    Right fn -> pure fn
  print (fn Fixtures.Project1.input)

compiler :: Aeson.Value -> Either Text (Input.Project -> Output.Output)
compiler = $$(PGenieGen.TH.compiler (PGenieGen.TH.LocationPath "./bundling-experiment"))

configJson :: Aeson.Value
configJson =
  [aesonQQ| 
    {
      "foo": "Foo!"
    } 
  |]
