let Prelude = ../../Prelude.dhall

let Equality = ../Type.dhall

let list = ./list.dhall

in  \(Element : Type) ->
    \(elementEquality : Equality Element) ->
      let equal =
            \(x : Prelude.NonEmpty.Type Element) ->
            \(y : Prelude.NonEmpty.Type Element) ->
                  elementEquality.equal x.head y.head
              &&  (list Element elementEquality).equal x.tail y.tail

      in  { equal } : Equality (Prelude.NonEmpty.Type Element)
