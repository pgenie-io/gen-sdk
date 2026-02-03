let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Typeclasses.dhall

in    { applicative = ./applicative.dhall
      , empty = ./default.dhall
      , or = ./or.dhall
      }
    : Typeclasses.Classes.Alternative.Type Compiled
