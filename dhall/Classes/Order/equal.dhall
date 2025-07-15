let Prelude = ../Prelude.dhall

let Order = ./Type.dhall

in  \(A : Type) -> \(order : Order A) -> order.equality.equal
