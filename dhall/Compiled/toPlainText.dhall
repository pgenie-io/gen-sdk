let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(compiled : Compiled Text) ->
      merge
        { Ok =
            \(ok : Text) ->
                  ''
                  OK!
                  ''
              ++  Prelude.Text.concatMapSep
                    "\n"
                    Report.Type
                    (Report.toPlainText "Warning")
                    compiled.warnings
              ++  "\n"
              ++  ok
        , Err =
            \(err : Report.Type) ->
                  ''
                  ERROR!
                  ''
              ++  Prelude.Text.concatMapSep
                    "\n"
                    Report.Type
                    (Report.toPlainText "Error")
                    (compiled.warnings # [ err ])
        }
        compiled.result
