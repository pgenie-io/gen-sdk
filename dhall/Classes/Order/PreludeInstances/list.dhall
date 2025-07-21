let Prelude = ../../Prelude.dhall

let Equality = ../../Equality/package.dhall

let Order = ../Type.dhall

let lessThan =
      \(Element : Type) ->
      \(elementOrder : Order Element) ->
      \(left : List Element) ->
      \(right : List Element) ->
        let leftLength = Prelude.List.length Element left

        let rightLength = Prelude.List.length Element right

        let Pair = { _1 : Element, _2 : Element }

        let zipped = Prelude.List.zip Element left Element right

        in  if    Prelude.Natural.lessThanEqual leftLength rightLength
            then  Prelude.List.fold
                    Pair
                    zipped
                    Bool
                    ( \(pair : Pair) ->
                      \(state : Bool) ->
                        if    state
                        then  True
                        else  elementOrder.lessThan pair._1 pair._2
                    )
                    False
            else  False

in  \(Element : Type) ->
    \(elementOrder : Order Element) ->
        { equality =
            Equality.PreludeInstances.list Element elementOrder.equality
        , lessThan = lessThan Element elementOrder
        }
      : Order (List Element)
