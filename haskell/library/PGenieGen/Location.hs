module PGenieGen.Location where

import AlgebraicPath qualified as Path
import PGenieGen.Prelude

data Location
  = LocationUrl Text (Maybe Text)
  | LocationPath Path (Maybe Text)

toCode :: Location -> Text
toCode = \case
  LocationUrl url hash -> appendHash url hash
  LocationPath path hash -> appendHash (Path.toText path) hash
  where
    appendHash :: Text -> Maybe Text -> Text
    appendHash base Nothing = base
    appendHash base (Just hash) = base <> " " <> hash
