let Lude = ../Deps/Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Deps/Typeclasses.dhall

in    { applicative = ./applicative.dhall
      , empty = ./default.dhall
      , or = ./or.dhall
      }
    : Typeclasses.Classes.Alternative.Type Compiled
