let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(message : Text) ->
      { reports = [ { path = [] : List Text, message } ], result = None A }
