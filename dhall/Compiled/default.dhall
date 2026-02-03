let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) ->
      { warnings = [] : List Report
      , result = (Result A).Err { path = [] : List Text, message = "" }
      }
