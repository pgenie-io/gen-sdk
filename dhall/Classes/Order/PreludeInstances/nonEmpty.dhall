let Prelude = ../Prelude.dhall

let Equality = ../../Equality/package.dhall

let Order = ../Type.dhall

let Comparison = ../Comparison.dhall

let list = ./list.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Order Element) ->
      \(left : Prelude.NonEmpty.Type Element) ->
      \(right : Prelude.NonEmpty.Type Element) ->
        merge
          { Smaller = Comparison.Smaller
          , Greater = Comparison.Greater
          , Equal = (list Element elementOrder).compare left.tail right.tail
          }
          (elementOrder.compare left.head right.head)

in  \(Element : Type) ->
    \(elementOrder : Order Element) ->
        { compare = compare Element elementOrder }
      : Order (Prelude.NonEmpty.Type Element)
