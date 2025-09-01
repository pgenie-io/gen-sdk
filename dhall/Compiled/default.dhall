let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
      { reports = [] : List { path : List Text, message : Text }
      , result = None A
      }
