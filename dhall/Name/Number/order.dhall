let Prelude = ./Prelude.dhall

let Number = ./Type.dhall

let Char = ./Char/package.dhall

let Classes = ../../Classes/package.dhall

let Order = Classes.Order

in  Order.PreludeInstances.nonEmpty Char.Type Char.order
