let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(compiled : Compiled Text) ->
      merge
        { Some =
            \(ok : Text) ->
                  ''
                  OK!
                  ''
              ++  Prelude.Text.concatMapSep
                    "\n"
                    Report.Type
                    (Report.toPlainText "Warning")
                    compiled.reports
              ++  "\n"
              ++  ok
        , None =
                ''
                ERROR!
                ''
            ++  Prelude.Text.concatMapSep
                  "\n"
                  Report.Type
                  (Report.toPlainText "Error")
                  compiled.reports
        }
        compiled.result
