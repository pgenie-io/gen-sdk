let Prelude = ../Prelude.dhall

let Equality = ../Equality/package.dhall

let Order =
      \(A : Type) ->
        { equality : Equality.Equality A, lessThan : A -> A -> Bool }

let equal =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        order.equality.equal x y

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

let lessThanOrEqual =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        lessThan A order x y || equal A order x y

let greaterThan =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        Prelude.Bool.not (lessThanOrEqual A order x y)

let greaterThanOrEqual =
      \(A : Type) ->
      \(order : Order A) ->
      \(x : A) ->
      \(y : A) ->
        Prelude.Bool.not (lessThan A order x y || equal A order x y)

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

in  { Order
    , equal
    , notEqual
    , lessThan
    , lessThanOrEqual
    , greaterThan
    , greaterThanOrEqual
    , Comparison
    , compare
    }
