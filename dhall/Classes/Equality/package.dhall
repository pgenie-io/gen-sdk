let Prelude = ../Prelude.dhall

let Equality = \(A : Type) -> { equal : A -> A -> Bool }

let equal =
      \(A : Type) ->
      \(equality : Equality A) ->
      \(x : A) ->
      \(y : A) ->
        equality.equal x y

let notEqual =
      \(A : Type) ->
      \(equality : Equality A) ->
      \(x : A) ->
      \(y : A) ->
        Prelude.Bool.not (equal A equality x y)

in  { Equality, equal, notEqual }
