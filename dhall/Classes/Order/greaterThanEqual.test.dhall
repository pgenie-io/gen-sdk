let Prelude = ./Prelude.dhall

let greaterThanEqual = ./greaterThanEqual.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let Comparison = ./Comparison.dhall

in  { greaterThanEqualFunction =
      { naturalGreater =
            assert
          : greaterThanEqual Natural PreludeInstances.natural 7 3 === True
      , naturalEqual =
            assert
          : greaterThanEqual Natural PreludeInstances.natural 5 5 === True
      , naturalLess =
            assert
          : greaterThanEqual Natural PreludeInstances.natural 3 7 === False
      , listGreater =
            assert
          :     greaterThanEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  True
      , listEqual =
            assert
          :     greaterThanEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  True
      , listLess =
            assert
          :     greaterThanEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  False
      }
    }
