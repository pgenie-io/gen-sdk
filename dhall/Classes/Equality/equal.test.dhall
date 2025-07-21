let Prelude = ./Prelude.dhall

let equal = ./equal.dhall

let Equality = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

in  { equalFunction =
      { naturalEqual =
          assert : equal Natural PreludeInstances.natural 5 5 === True
      , naturalNotEqual =
          assert : equal Natural PreludeInstances.natural 3 7 === False
      , listEqual =
            assert
          :     equal
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  True
      , listNotEqual =
            assert
          :     equal
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 1, 2, 4 ]
            ===  False
      }
    }
