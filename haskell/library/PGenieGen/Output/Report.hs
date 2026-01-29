module PGenieGen.Output.Report where

import Data.Aeson qualified as Aeson
import Dhall qualified
import Dhall.Core qualified
import Dhall.JSONToDhall qualified as Dhall.FromJson
import Dhall.Src qualified
import PGenieGen.Dhall.Deriving qualified as Dhall.Deriving
import PGenieGen.Dhall.ExprViews qualified as ExprViews
import PGenieGen.Input qualified as Project
import PGenieGen.Prelude
import TextBuilder qualified

data Report = Report
  { path :: [Text],
    message :: Text
  }
  deriving stock (Generic, Show, Eq)
  deriving anyclass (Dhall.FromDhall, Dhall.ToDhall)

toYamlText :: Text -> Report -> Text
toYamlText label report =
  (from @TextBuilder.TextBuilder . mconcat)
    [ "- ",
      to label,
      ": ",
      to report.message,
      "\n  Context:",
      foldMap
        ( \p ->
            mconcat
              [ "\n    - ",
                to p
              ]
        )
        report.path
    ]

toErrorYamlText :: Report -> Text
toErrorYamlText = toYamlText "Error"

toWarningYamlText :: Report -> Text
toWarningYamlText = toYamlText "Warning"
