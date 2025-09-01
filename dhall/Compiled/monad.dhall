let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

in    { applicative = ./applicative.dhall, flatMap = ./flatMap.dhall }
    : Lude.Algebras.Monad.Type Compiled
