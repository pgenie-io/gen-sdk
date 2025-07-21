let Prelude = ../Prelude.dhall

let Equality = ./Type.dhall

let equal = ./equal.dhall

let notEqual = ./notEqual.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

in  { Equality, equal, notEqual, PreludeInstances }
