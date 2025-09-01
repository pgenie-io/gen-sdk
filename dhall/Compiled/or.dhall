let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

in  \(A : Type) ->
    \(left : Compiled A) ->
    \(right : Compiled A) ->
      Prelude.Optional.fold
        A
        left.result
        (Compiled A)
        (\(leftResult : A) -> left)
        { reports = left.reports # right.reports, result = right.result }
