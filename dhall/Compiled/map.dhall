let Prelude = ../Prelude.dhall

let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

let Result = ./Result/package.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> B) ->
    \(compiled : Compiled A) ->
        { warnings = compiled.warnings
        , result = Result.map A B f compiled.result
        }
      : Compiled B
