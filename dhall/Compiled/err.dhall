let Prelude = ../Prelude.dhall

let Self = ./Type.dhall

let Result = ./Result/package.dhall

let Report = ./Report/package.dhall

in  \(A : Type) ->
    \(path : List Text) ->
    \(message : Text) ->
        { warnings = [] : List Report.Type, result = Result.err A path message }
      : Self A
