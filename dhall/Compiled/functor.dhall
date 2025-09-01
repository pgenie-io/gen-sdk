let Prelude = ../Prelude.dhall

let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

in  { map = ./map.dhall } : Lude.Algebras.Functor.Type Compiled
