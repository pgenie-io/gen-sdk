{-# OPTIONS_GHC -Wno-orphans #-}

module PGenieGen.Dhall.Orphans.FromDhall where

import Dhall.Marshal.Decode
import PGenieGen.Prelude

instance (FromDhall a) => FromDhall (NonEmpty a) where
  autoWith normalizer =
    record
      ( (:|)
          <$> field "head" (autoWith normalizer)
          <*> field "tail" (autoWith normalizer)
      )
