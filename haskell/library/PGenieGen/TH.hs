module PGenieGen.TH where

import Data.Text.IO qualified as Text.IO
import Dhall qualified
import Dhall.Core qualified
import Dhall.Pretty qualified
import Dhall.TH qualified
import Language.Haskell.TH.Syntax qualified as TH
import PGenieGen.Dhall.TH qualified as Dhall.TH
import PGenieGen.Input qualified as Input
import PGenieGen.Output qualified as Output
import PGenieGen.Prelude

-- | Executes a Dhall expression at compile time and constructs a Haskell value at compile time.
genFunc ::
  -- | Dhall expression code.
  Text ->
  TH.Q (TH.TExp (Input.Project -> Output.Output))
genFunc = Dhall.TH.interpretedDhallExpr
