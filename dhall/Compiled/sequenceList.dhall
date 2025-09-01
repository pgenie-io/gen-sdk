let Lude = ../Lude.dhall

let Compiled = ./Type.dhall

in    Lude.Algebras.Applicative.sequenceList Compiled ./applicative.dhall
    : forall (A : Type) -> List (Compiled A) -> Compiled (List A)
