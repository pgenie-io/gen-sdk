-- | Integration with generator adapters.
module PGenieGen
  ( Input,
    Output,
    Location (..),
    loadDynamically,
    loadStatically,
  )
where

import PGenieGen.Dynamic
import PGenieGen.Location
import PGenieGen.Model
import PGenieGen.Static
