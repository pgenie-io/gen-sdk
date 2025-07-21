let Self = ./Type.dhall

let Classes = ../Classes/package.dhall

let order = ./order.dhall

in  Classes.Order.toEquality Self order : Classes.Equality.Type Self
