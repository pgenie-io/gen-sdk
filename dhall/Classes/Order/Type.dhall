let Equality = ../Equality/package.dhall

in  \(A : Type) -> { equality : Equality.Equality A, lessThan : A -> A -> Bool }
