let Self = ./Type.dhall

let Classes = ../../../Classes/package.dhall

in  { equal = ./equal.dhall } : Classes.Equality.Equality Self
