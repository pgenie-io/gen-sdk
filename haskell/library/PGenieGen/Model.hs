module PGenieGen.Model where

import AlgebraicPath qualified as Path
import Data.Aeson qualified as Aeson
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Src qualified
import PGenieGen.Contract qualified as Contract
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.ExprViews qualified as ExprViews
import PGenieGen.Model.Input qualified as Project
import PGenieGen.Model.Output qualified as Output
import PGenieGen.Prelude

type Input = Project.Project

type Output = Output.Output
