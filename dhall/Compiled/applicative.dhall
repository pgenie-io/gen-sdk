let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Typeclasses.dhall

in    { functor = ./functor.dhall, pure = ./ok.dhall, map2 = ./map2.dhall }
    : Typeclasses.Classes.Applicative.Type Compiled
