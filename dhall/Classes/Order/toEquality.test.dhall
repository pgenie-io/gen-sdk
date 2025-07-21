let Prelude = ./Prelude.dhall

let toEquality = ./toEquality.dhall

let Order = ./Type.dhall

let Equality = ../Equality/Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let EqualityPreludeInstances = ../Equality/PreludeInstances/package.dhall

in  { toEqualityFunction =
      { naturalEquality =
          let equalityFromOrder = toEquality Natural PreludeInstances.natural

          let directEquality = EqualityPreludeInstances.natural

          in  { convertedEqual =
                    assert
                  : equalityFromOrder.equal 5 5 === directEquality.equal 5 5
              , convertedNotEqual =
                    assert
                  : equalityFromOrder.equal 3 7 === directEquality.equal 3 7
              }
      , listEquality =
          let equalityFromOrder =
                toEquality
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)

          let directEquality =
                EqualityPreludeInstances.list
                  Natural
                  EqualityPreludeInstances.natural

          in  { convertedListEqual =
                    assert
                  :     equalityFromOrder.equal [ 1, 2, 3 ] [ 1, 2, 3 ]
                    ===  directEquality.equal [ 1, 2, 3 ] [ 1, 2, 3 ]
              , convertedListNotEqual =
                    assert
                  :     equalityFromOrder.equal [ 1, 2, 3 ] [ 1, 2, 4 ]
                    ===  directEquality.equal [ 1, 2, 3 ] [ 1, 2, 4 ]
              }
      }
    }
