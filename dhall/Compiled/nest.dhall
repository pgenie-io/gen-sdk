let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

in  \(A : Type) ->
    \(context : Text) ->
    \(compiled : Compiled A) ->
        { reports =
            Prelude.List.map
              Report.Type
              Report.Type
              (Report.nest context)
              compiled.reports
        , result = compiled.result
        }
      : Compiled A
