module PGenieGen.Location where

import AlgebraicPath qualified as Path
import PGenieGen.Prelude

data Location
  = LocationUrl Text
  | LocationPath Path

toCode :: Location -> Text
toCode = \case
  LocationUrl url -> url <> "/Gen.dhall"
  LocationPath path -> Path.toText (path <> "Gen.dhall")
