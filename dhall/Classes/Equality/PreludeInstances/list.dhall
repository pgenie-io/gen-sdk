let Prelude = ../../Prelude.dhall

let Equality = ../Type.dhall

let natural = ./natural.dhall

in  \(Element : Type) ->
    \(elementEquality : Equality Element) ->
      let equal =
            \(x : List Element) ->
            \(y : List Element) ->
              let lengthsEqual =
                    natural.equal
                      (Prelude.List.length Element x)
                      (Prelude.List.length Element y)

              let Pair = { _1 : Element, _2 : Element }

              in  if    lengthsEqual
                  then  Prelude.List.fold
                          Pair
                          (Prelude.List.zip Element x Element y)
                          Bool
                          ( \(pair : Pair) ->
                            \(state : Bool) ->
                              state && elementEquality.equal pair._1 pair._2
                          )
                          True
                  else  False

      in  { equal } : Equality (List Element)
