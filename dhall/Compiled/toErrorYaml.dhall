let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(Result : Type) ->
    \(compiled : Compiled Result) ->
      merge
        { Ok = \(ok : Result) -> None Text
        , Err = \(err : Report.Type) -> Some (Report.toPlainText "Error" err)
        }
        compiled.result
      : Optional Text
