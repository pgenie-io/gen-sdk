let Prelude = ./Prelude.dhall

let Number = ./Type.dhall

let Char = ./Char/package.dhall

let Classes = ../../Classes/package.dhall

let Order = Classes.Order

in  \(left : Number) ->
    \(right : Number) ->
      Classes.Order.compareNonEmpty Char.Type Char.order left right
