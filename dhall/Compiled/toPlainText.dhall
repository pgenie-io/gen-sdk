let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(compiled : Compiled Text) ->
          Prelude.Text.concatMapSep
            "\n"
            Report.Type
            Report.toPlainText
            compiled.reports
      ++  Prelude.Optional.fold
            Text
            compiled.result
            Text
            (\(a : Text) -> "\n" ++ a)
            ""
