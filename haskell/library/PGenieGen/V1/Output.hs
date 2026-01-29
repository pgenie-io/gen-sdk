module PGenieGen.V1.Output
  ( Output (..),
    Report (..),
    File (..),
  )
where

import Data.Aeson qualified as Aeson
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Src qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.ExprViews qualified as ExprViews
import PGenieGen.Prelude
import PGenieGen.V1.Input qualified as Project
import PGenieGen.V1.Output.Report (Report (..))
import TextBuilder qualified

data Output = Output
  { reports :: [Report],
    result :: Maybe [File]
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

data File = File
  { path :: Text,
    content :: Text
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)
