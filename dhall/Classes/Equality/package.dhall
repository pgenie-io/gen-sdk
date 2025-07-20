let Prelude = ../Prelude.dhall

let Equality = ./Type.dhall

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

let PreludeInstances = ./PreludeInstances/package.dhall

in  { Equality, equal, notEqual, PreludeInstances }
