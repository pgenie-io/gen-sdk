let Prelude = ./Prelude.dhall

let lessThan = ./lessThan.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let Comparison = ./Comparison.dhall

in  { lessThanFunction =
      { naturalLess =
          assert : lessThan Natural PreludeInstances.natural 3 7 === True
      , naturalGreater =
          assert : lessThan Natural PreludeInstances.natural 7 3 === False
      , naturalEqual =
          assert : lessThan Natural PreludeInstances.natural 5 5 === False
      , listLess =
            assert
          :     lessThan
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  True
      , listGreater =
            assert
          :     lessThan
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
