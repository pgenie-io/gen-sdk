module PGenieGen.Dhall.TH where

import Data.Text.IO qualified as Text.IO
import Dhall qualified
import Dhall.Core qualified
import Dhall.Pretty qualified
import Dhall.TH qualified
import Language.Haskell.TH.Syntax qualified as TH
import PGenieGen.Prelude

-- | Executes a Dhall expression at compile time and constructs a Haskell value at compile time.
--
-- Under the hood it uses the provided 'Dhall.FromDhall' check the Dhall expression to decode successfully into the expected type, but because the type may not be @TH.Lift@able (e.g., a function), we decode it again at runtime, but since we've already checked the decoding at compile time, the runtime decoding cannot fail.
interpretedDhallExpr ::
  forall a.
  (Dhall.FromDhall a) =>
  -- | Dhall expression code.
  Text ->
  TH.Q (TH.TExp a)
interpretedDhallExpr dhallCode = do
  loadedExpr <- TH.runIO do
    let decoder = Dhall.auto @a
    loadedExpr <- Dhall.inputExpr dhallCode
    Dhall.expectWithSettings Dhall.defaultInputSettings decoder loadedExpr
    _ <- Dhall.rawInput decoder loadedExpr
    pure loadedExpr
  TH.examineCode
    [||
    case Dhall.rawInput Dhall.auto loadedExpr of
      Nothing -> undefined -- This cannot happen because we already checked it at compile time.
      Just val -> val
    ||]
