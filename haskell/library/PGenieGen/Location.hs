module PGenieGen.Location where

import AlgebraicPath qualified as Path
import PGenieGen.Prelude

data Location
  = LocationUrl Text
  | LocationPath Path

toCode :: Location -> Text
toCode = \case
  LocationUrl url -> url
  LocationPath path -> Path.toText path
