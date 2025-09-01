let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(B : Type) ->
    \(f : A -> Compiled B) ->
    \(a : Compiled A) ->
        Prelude.Optional.fold
          A
          a.result
          (Compiled B)
          ( \(aResult : A) ->
              let b = f aResult

              in  { reports = a.reports # b.reports, result = b.result }
          )
          { reports = a.reports, result = None B }
      : Compiled B
