let Self = ./Type.dhall

let Classes = ../../Classes/package.dhall

let Order = Classes.Order

let Comparison = Order.Comparison

let Word = ../Word/package.dhall

let Number = ../Number/package.dhall

let compare
    : Self -> Self -> Comparison
    = \(left : Self) ->
      \(right : Self) ->
        merge
          { Number =
              \(left : Number.Type) ->
                merge
                  { Number =
                      \(right : Number.Type) -> Number.order.compare left right
                  , Word = \(right : Word.Type) -> Comparison.Smaller
                  }
                  right
          , Word =
              \(left : Word.Type) ->
                merge
                  { Number = \(right : Number.Type) -> Comparison.Greater
                  , Word = \(right : Word.Type) -> Word.order.compare left right
                  }
                  right
          }
          left

in  { compare } : Order.Type Self
