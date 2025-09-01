let Prelude = ../Prelude.dhall

let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> B) ->
    \(compiled : Compiled A) ->
        { reports = compiled.reports
        , result = Prelude.Optional.map A B f compiled.result
        }
      : Compiled B
