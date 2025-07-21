let Prelude = ../Prelude.dhall

let Equality = ../../Equality/package.dhall

let Order = ../Type.dhall

let Comparison = ../Comparison.dhall

let compare =
      \(Element : Type) ->
      \(elementOrder : Order Element) ->
      \(left : List Element) ->
      \(right : List Element) ->
        let Pair = { _1 : Element, _2 : Element }

        let zipped = Prelude.List.zip Element left Element right

        let zippedComparison =
              Prelude.List.foldLeft
                Pair
                zipped
                Comparison
                ( \(state : Comparison) ->
                  \(pair : Pair) ->
                    merge
                      { Smaller = Comparison.Smaller
                      , Greater = Comparison.Greater
                      , Equal = elementOrder.compare pair._1 pair._2
                      }
                      state
                )
                Comparison.Equal

        in  merge
              { Smaller = Comparison.Smaller
              , Greater = Comparison.Greater
              , Equal =
                  let leftLength = Prelude.List.length Element left

                  let rightLength = Prelude.List.length Element right

                  in  if    Prelude.Natural.lessThan leftLength rightLength
                      then  Comparison.Smaller
                      else  if Prelude.Natural.equal leftLength rightLength
                      then  Comparison.Equal
                      else  Comparison.Greater
              }
              zippedComparison

in  \(Element : Type) ->
    \(elementOrder : Order Element) ->
      { compare = compare Element elementOrder } : Order (List Element)
