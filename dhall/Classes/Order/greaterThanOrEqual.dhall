let Prelude = ../Prelude.dhall

let Order = ./Type.dhall

in  \(A : Type) ->
    \(order : Order A) ->
    \(x : A) ->
    \(y : A) ->
      Prelude.Bool.not (order.lessThan x y)
