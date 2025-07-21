let Prelude = ./Prelude.dhall

let equal = ./equal.dhall

let Order = ./Type.dhall

let PreludeInstances = ./PreludeInstances/package.dhall

let Comparison = ./Comparison.dhall

in  { matchesEqualOnNaturalWhen =
      { smallerByOne =
            assert
          :     equal Natural PreludeInstances.natural 4 5
            ===  Prelude.Natural.equal 4 5
      , largerByOne =
            assert
          :     equal Natural PreludeInstances.natural 5 4
            ===  Prelude.Natural.equal 5 4
      , equal =
            assert
          :     equal Natural PreludeInstances.natural 4 4
            ===  Prelude.Natural.equal 4 4
      , zero =
            assert
          :     equal Natural PreludeInstances.natural 0 0
            ===  Prelude.Natural.equal 0 0
      }
    }
