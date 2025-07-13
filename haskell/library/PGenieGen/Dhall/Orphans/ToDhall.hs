{-# OPTIONS_GHC -Wno-orphans #-}

module PGenieGen.Dhall.Orphans.ToDhall where

import Dhall.Marshal.Encode
import PGenieGen.Prelude

instance (ToDhall a) => ToDhall (NonEmpty a) where
  injectWith normalizer =
    recordEncoder
      ( adapt
          >$< encodeFieldWith "head" (injectWith normalizer)
            >*< encodeFieldWith "tail" (injectWith normalizer)
      )
    where
      adapt (h :| t) = (h, t)
