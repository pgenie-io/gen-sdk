let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Result = ./Result/package.dhall

in  \(A : Type) ->
    \(a : A) ->
        { warnings = [] : List { path : List Text, message : Text }
        , result = Result.ok A a
        }
      : Compiled A
