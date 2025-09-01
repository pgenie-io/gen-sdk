-- Analogue to Haskell's `liftA2`
let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(C : Type) ->
    \(f : A -> B -> C) ->
    \(a : Compiled A) ->
    \(b : Compiled B) ->
      { reports = a.reports # b.reports
      , result =
          Prelude.Optional.concatMap
            A
            C
            (\(a : A) -> Prelude.Optional.map B C (f a) b.result)
            a.result
      }
