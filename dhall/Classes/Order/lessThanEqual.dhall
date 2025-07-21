let Prelude = ./Prelude.dhall

let Order = ./Type.dhall

let Comparison = ./Comparison.dhall

in  \(A : Type) ->
    \(order : Order A) ->
    \(x : A) ->
    \(y : A) ->
      merge
        { Smaller = True, Greater = False, Equal = True }
        (order.compare x y)
