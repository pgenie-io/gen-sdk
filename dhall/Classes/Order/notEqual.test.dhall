let Prelude = ./Prelude.dhall

let notEqual = ./notEqual.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let Comparison = ./Comparison.dhall

in  { notEqualFunction =
      { naturalNotEqual =
          assert : notEqual Natural PreludeInstances.natural 3 7 === True
      , naturalEqual =
          assert : notEqual Natural PreludeInstances.natural 5 5 === False
      , listNotEqual =
            assert
          :     notEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 1, 2, 4 ]
            ===  True
      , listEqual =
            assert
          :     notEqual
                  (List Natural)
                  (PreludeInstances.list Natural PreludeInstances.natural)
                  [ 1, 2, 3 ]
                  [ 1, 2, 3 ]
            ===  False
      }
    }
