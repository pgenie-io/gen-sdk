let Prelude = ../Deps/Prelude.dhall

let Lude = ../Deps/Lude.dhall

let Typeclasses = ../Deps/Typeclasses.dhall

let Compiled = ./Type.dhall

in  { map = ./map.dhall } : Typeclasses.Classes.Functor.Type Compiled
