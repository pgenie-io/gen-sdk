let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(Result : Type) ->
    \(compiled : Compiled Result) ->
      merge
        { Some =
            \(ok : Result) ->
              Prelude.Text.concatMapSep
                "\n"
                Report.Type
                (Report.toPlainText "Warning")
                compiled.reports
        , None =
            Prelude.Text.concatMapSep
              "\n"
              Report.Type
              (Report.toPlainText "Error")
              compiled.reports
        }
        compiled.result
      : Text
