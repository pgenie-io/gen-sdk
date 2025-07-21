-- Assuming that the input list is already sorted and deduplicated,
-- inserts a new element into the list if it is not already present,
-- maintaining the sorted order.
let Prelude = ../Prelude.dhall

let Order = ./Type.dhall

let equal = ./equal.dhall

let lessThanEqual = ./lessThanEqual.dhall

let greaterThanEqual = ./greaterThanEqual.dhall

in  \(A : Type) ->
      let State
          : Type
          = { inserted : Bool, list : List A }

      let initialState
          : State
          = { inserted = False, list = [] : List A }

      in  \(order : Order A) ->
          \(newElement : A) ->
            let updateState
                : A -> State -> State
                = \(element : A) ->
                  \(state : State) ->
                    if        state.inserted
                          ||  greaterThanEqual A order newElement element
                    then  state // { list = [ element ] # state.list }
                    else  { inserted = True
                          , list = [ element, newElement ] # state.list
                          }

            let finishState
                : State -> List A
                = \(state : State) ->
                    if    state.inserted
                    then  Prelude.List.reverse A state.list
                    else  [ newElement ] # Prelude.List.reverse A state.list

            in  \(list : List A) ->
                  finishState
                    (Prelude.List.fold A list State updateState initialState)
