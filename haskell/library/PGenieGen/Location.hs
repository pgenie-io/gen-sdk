module PGenieGen.Location where

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
import PGenieGen.Model.Input qualified as Input
import PGenieGen.Model.Output qualified as Output
import PGenieGen.Prelude

data Location
  = LocationUrl Text
  | LocationPath Path

toCode :: Location -> Text
toCode = \case
  LocationUrl url -> url <> "/Gen.dhall"
  LocationPath path -> Path.toText (path <> "Gen.dhall")
