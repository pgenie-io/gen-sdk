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
              ++  Prelude.Text.concatSep
                    "\n"
                    (   Prelude.List.map
                          Report.Type
                          Text
                          (Report.toPlainText "Warning")
                          compiled.warnings
                      # [ Report.toPlainText "Error" err ]
                    )
        }
        compiled.result
