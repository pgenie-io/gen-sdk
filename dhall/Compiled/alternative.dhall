let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

in    { applicative = ./applicative.dhall
      , empty = ./default.dhall
      , or = ./or.dhall
      }
    : Lude.Algebras.Alternative.Type Compiled
