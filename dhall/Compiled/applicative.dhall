let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

in    { functor = ./functor.dhall, pure = ./ok.dhall, map2 = ./map2.dhall }
    : Lude.Algebras.Applicative.Type Compiled
