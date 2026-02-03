let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Typeclasses.dhall

in    Typeclasses.Classes.Applicative.traverseList Compiled ./applicative.dhall
    : forall (A : Type) ->
      forall (B : Type) ->
      (A -> Compiled B) ->
      List A ->
        Compiled (List B)
