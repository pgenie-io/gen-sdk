module PGenieGen.Dhall.TH where

import Data.Text.IO qualified as Text.IO
import Dhall qualified
import Dhall.Core qualified
import Dhall.Pretty qualified
import Dhall.TH qualified
import Language.Haskell.TH.Syntax qualified as TH
import PGenieGen.Prelude

-- | Executes a Dhall expression at compile time and constructs a Haskell value at compile time.
interpretedDhallExpr ::
  (Dhall.FromDhall a, TH.Lift a) =>
  -- | Dhall expression code.
  Text ->
  TH.Q (TH.TExp a)
interpretedDhallExpr dhallCode = do
  value <- TH.runIO $ Dhall.input Dhall.auto dhallCode
  TH.examineCode (TH.liftTyped value)
