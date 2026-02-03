let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
    \(context : Text) ->
    \(compiled : Compiled A) ->
        { warnings =
            Prelude.List.map
              Report.Type
              Report.Type
              (Report.nest context)
              compiled.warnings
        , result =
            merge
              { Ok = (Result A).Ok
              , Err =
                  \(err : Report.Type) ->
                    (Result A).Err (Report.nest context err)
              }
              compiled.result
        }
      : Compiled A
