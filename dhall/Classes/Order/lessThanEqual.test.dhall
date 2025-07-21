let Prelude = ./Prelude.dhall

let lessThanEqual = ./lessThanEqual.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let Comparison = ./Comparison.dhall

in  { lessThanEqualFunction =
      { naturalLess =
          assert : lessThanEqual Natural PreludeInstances.natural 3 7 === True
      , naturalEqual =
          assert : lessThanEqual Natural PreludeInstances.natural 5 5 === True
      , naturalGreater =
          assert : lessThanEqual Natural PreludeInstances.natural 7 3 === False
      , listLess =
            assert
          :     lessThanEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  True
      , listEqual =
            assert
          :     lessThanEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  True
      , listGreater =
            assert
          :     lessThanEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
