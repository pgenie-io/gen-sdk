module PGenieGen.Model.Output
  ( Output (..),
    OutputOk (..),
    Report (..),
    File (..),
  )
where

import Dhall qualified
import Dhall.Deriving qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.Orphans ()
import PGenieGen.Model.Output.Report (Report (..))
import PGenieGen.Prelude

-- | Successful generator output.
data OutputOk = OutputOk
  { warnings :: [Report],
    value :: [File]
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

data Output
  = OkOutput OutputOk
  | ErrOutput Report
  deriving stock (Generic, Show, Eq)
  deriving
    (Dhall.FromDhall, Dhall.ToDhall)
    via (Dhall.Deriving.Codec (Dhall.Deriving.SumModifier "Output") Output)

data File = File
  { path :: Path,
    content :: Text
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)
