let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(a : A) ->
        { reports = [] : List { path : List Text, message : Text }
        , result = Some a
        }
      : Compiled A
