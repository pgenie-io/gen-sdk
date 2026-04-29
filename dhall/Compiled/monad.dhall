let Lude = ../Deps/Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Deps/Typeclasses.dhall

in    { applicative = ./applicative.dhall, flatMap = ./flatMap.dhall }
    : Typeclasses.Classes.Monad.Type Compiled
