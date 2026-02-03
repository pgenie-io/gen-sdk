let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(Result : Type) ->
    \(compiled : Compiled Result) ->
        ( if    Prelude.List.null Report.Type compiled.warnings
          then  None Text
          else  Some
                  ( Prelude.Text.concatMapSep
                      "\n"
                      Report.Type
                      (Report.toPlainText "Warning")
                      compiled.warnings
                  )
        )
      : Optional Text
