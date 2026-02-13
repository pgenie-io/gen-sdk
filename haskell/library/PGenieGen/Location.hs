module PGenieGen.Location where

import AlgebraicPath qualified as Path
import PGenieGen.Prelude

-- | Location of a Dhall generator file, optionally with an integrity hash.
-- 
-- The hash should be in the format "sha256:HASH" as produced by @dhall freeze@.
-- When a hash is provided, it will be appended to the import expression,
-- enabling Dhall's semantic integrity checking.
data Location
  = LocationUrl Text (Maybe Text)
  | LocationPath Path (Maybe Text)

-- | Convert a Location to Dhall code.
-- 
-- If a hash is present, it will be appended to the import with a space separator.
-- For example:
--
-- @
-- toCode (LocationUrl "https://example.com/gen.dhall" Nothing)
--   == "https://example.com/gen.dhall"
-- 
-- toCode (LocationUrl "https://example.com/gen.dhall" (Just "sha256:abc123..."))
--   == "https://example.com/gen.dhall sha256:abc123..."
-- @
toCode :: Location -> Text
toCode = \case
  LocationUrl url hash -> appendHash url hash
  LocationPath path hash -> appendHash (Path.toText path) hash
  where
    appendHash :: Text -> Maybe Text -> Text
    appendHash base Nothing = base
    appendHash base (Just hash) = base <> " " <> hash

-- | Construct a URL location without a hash.
locationUrl :: Text -> Location
locationUrl url = LocationUrl url Nothing

-- | Construct a URL location with a hash.
locationUrlWithHash :: Text -> Text -> Location
locationUrlWithHash url hash = LocationUrl url (Just hash)

-- | Construct a path location without a hash.
locationPath :: Path -> Location
locationPath path = LocationPath path Nothing

-- | Construct a path location with a hash.
locationPathWithHash :: Path -> Text -> Location
locationPathWithHash path hash = LocationPath path (Just hash)
