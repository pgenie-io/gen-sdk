let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
    \(path : List Text) ->
    \(message : Text) ->
      { warnings = [] : List Report, result = (Result A).Err { path, message } }
