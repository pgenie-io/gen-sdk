let Prelude = ../Prelude.dhall

let Order = ./Type.dhall

let equal = ./equal.dhall

let notEqual =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        Prelude.Bool.not (equal A order x y)

let lessThan =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        order.lessThan x y

let lessThanOrEqual = ./lessThanOrEqual.dhall

let greaterThan =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        Prelude.Bool.not (lessThanOrEqual A order x y)

let greaterThanOrEqual = ./greaterThanOrEqual.dhall

let Comparison = < Smaller | Equal | Greater >

let compare =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        if    lessThan A order x y
        then  Comparison.Smaller
        else  if equal A order x y
        then  Comparison.Equal
        else  Comparison.Greater

let insertIntoDedupedSortedList = ./insertIntoDedupedSortedList.dhall

let dedupAndSortList = ./dedupAndSortList.dhall

in  { Order
    , equal
    , notEqual
    , lessThan
    , lessThanOrEqual
    , greaterThan
    , greaterThanOrEqual
    , Comparison
    , compare
    , insertIntoDedupedSortedList
    , dedupAndSortList
    }
