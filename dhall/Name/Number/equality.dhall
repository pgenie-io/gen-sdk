let Number = ./Type.dhall

let Char = ./Char/package.dhall

let Classes = ../../Classes/package.dhall

let Equality = Classes.Equality

in    Equality.PreludeInstances.nonEmpty Char.Type Char.equality
    : Equality.Type Number
