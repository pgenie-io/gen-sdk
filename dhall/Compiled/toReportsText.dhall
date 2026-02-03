let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(Result : Type) ->
    \(compiled : Compiled Result) ->
      merge
        { Ok =
            \(ok : Result) ->
              Prelude.Text.concatMapSep
                "\n"
                Report.Type
                (Report.toPlainText "Warning")
                compiled.warnings
        , Err =
            \(err : Report.Type) ->
              Prelude.Text.concatMapSep
                "\n"
                Report.Type
                (Report.toPlainText "Error")
                (compiled.warnings # [ err ])
        }
        compiled.result
      : Text
