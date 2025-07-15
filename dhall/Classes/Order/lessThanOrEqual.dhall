let Prelude = ../Prelude.dhall

let Order = ./Type.dhall

in  \(A : Type) ->
    \(order : Order A) ->
    \(x : A) ->
    \(y : A) ->
      order.lessThan x y || order.equality.equal x y
