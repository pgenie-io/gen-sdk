let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(path : List Text) ->
    \(message : Text) ->
      { reports = [ { path, message } ], result = None A }
