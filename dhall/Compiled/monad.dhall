let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Typeclasses.dhall

in    { applicative = ./applicative.dhall, flatMap = ./flatMap.dhall }
    : Typeclasses.Classes.Monad.Type Compiled
