let Prelude = ../Prelude.dhall

let Lude = ../Lude.dhall

let Typeclasses = ../Typeclasses.dhall

let Compiled = ./Type.dhall

in  { map = ./map.dhall } : Typeclasses.Classes.Functor.Type Compiled
