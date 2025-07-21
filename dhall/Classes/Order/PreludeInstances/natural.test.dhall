let Prelude = ../Prelude.dhall

let Order = ../Type.dhall

let Comparison = ../Comparison.dhall

let PreludeInstances = ./package.dhall

let subj = PreludeInstances.natural

in  { compare =
      { smallerNumbers = assert : subj.compare 3 5 === Comparison.Smaller
      , greaterNumbers = assert : subj.compare 7 2 === Comparison.Greater
      , equalNumbers = assert : subj.compare 4 4 === Comparison.Equal
      , zeroComparisons =
        { zeroLessThanPositive =
            assert : subj.compare 0 1 === Comparison.Smaller
        , positiveGreaterThanZero =
            assert : subj.compare 1 0 === Comparison.Greater
        , zeroEqualsZero = assert : subj.compare 0 0 === Comparison.Equal
        }
      , largeNumbers =
        { smallerLarge = assert : subj.compare 999 1000 === Comparison.Smaller
        , greaterLarge = assert : subj.compare 1000 999 === Comparison.Greater
        , equalLarge = assert : subj.compare 1000 1000 === Comparison.Equal
        }
      }
    }
