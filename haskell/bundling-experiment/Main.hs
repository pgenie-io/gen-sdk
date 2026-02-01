module Main (main) where

import Control.Monad (forM_)
import Data.Aeson qualified as Aeson
import Data.Aeson.QQ.Simple (aesonQQ)
import Data.List.NonEmpty qualified as NonEmpty
import Data.Text (Text)
import Data.Text.IO qualified as Text.IO
import Dhall.Pretty qualified
import Dhall.Core qualified
import Dhall.TH qualified
import PGenieGen qualified as PGenieGen
import PGenieGen.Input qualified as Input
import PGenieGen.Output qualified as Output
import PGenieGen.Output.Report qualified as Output.Report
import System.Exit
import Test.Hspec
import TextBuilder qualified
import Prelude
import Prettyprinter qualified as Pp
import Prettyprinter.Render.Text qualified as Pp

main :: IO ()
main = do
  Text.IO.putStrLn renderedExpr

renderedExpr :: Text
renderedExpr =
  Pp.renderStrict (Pp.layoutPretty Pp.defaultLayoutOptions (Dhall.Pretty.prettyExpr expr))

expr :: Dhall.Core.Expr s Void
expr =
  [Dhall.TH.dhall|
    ./bundling-experiment/Gen.dhall
  |]
