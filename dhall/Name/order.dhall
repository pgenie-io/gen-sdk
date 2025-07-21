let Self = ./Type.dhall

let Classes = ../Classes/package.dhall

let Order = Classes.Order

let Comparison = Order.Comparison

let Word = ./Word/package.dhall

let WordOrNumber = ./WordOrNumber/package.dhall

let compare
    : Self -> Self -> Comparison
    = \(left : Self) ->
      \(right : Self) ->
        let comparison = Word.order.compare left.head right.head

        let handler =
              { Smaller = Comparison.Smaller
              , Greater = Comparison.Greater
              , Equal =
                  ( Order.PreludeInstances.list
                      WordOrNumber.Type
                      WordOrNumber.order
                  ).compare
                    left.tail
                    right.tail
              }

        in  merge handler comparison

in  { compare } : Order.Type Self
