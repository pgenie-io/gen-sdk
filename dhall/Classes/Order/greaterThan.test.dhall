let Prelude = ./Prelude.dhall

let greaterThan = ./greaterThan.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let Comparison = ./Comparison.dhall

in  { greaterThanFunction =
      { naturalGreater =
          assert : greaterThan Natural PreludeInstances.natural 7 3 === True
      , naturalLess =
          assert : greaterThan Natural PreludeInstances.natural 3 7 === False
      , naturalEqual =
          assert : greaterThan Natural PreludeInstances.natural 5 5 === False
      , listGreater =
            assert
          :     greaterThan
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 2, 3, 4 ]
                  [ 1, 2, 3 ]
            ===  True
      , listLess =
            assert
          :     greaterThan
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 2, 3, 4 ]
            ===  False
      }
    }
