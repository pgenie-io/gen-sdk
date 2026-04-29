let Lude = ../Deps/Lude.dhall

let Compiled = ./Type.dhall

let Typeclasses = ../Deps/Typeclasses.dhall

in    Typeclasses.Classes.Applicative.sequenceList Compiled ./applicative.dhall
    : forall (A : Type) -> List (Compiled A) -> Compiled (List A)
