module PGenieGen.Model.Output
  ( Output (..),
    Report (..),
    File (..),
  )
where

import Dhall qualified
import PGenieGen.Dhall.Orphans ()
import PGenieGen.Model.Output.Report (Report (..))
import PGenieGen.Prelude

data Output = Output
  { reports :: [Report],
    result :: Maybe [File]
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

data File = File
  { path :: Path,
    content :: Text
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)
