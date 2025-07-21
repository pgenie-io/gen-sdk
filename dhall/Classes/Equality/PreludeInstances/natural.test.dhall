let Prelude = ../Prelude.dhall

let Equality = ../Type.dhall

let PreludeInstances = ./package.dhall

let subj = PreludeInstances.natural

in  { equal =
      { sameNumbers =
        { zero = assert : subj.equal 0 0 === True
        , positiveNumber = assert : subj.equal 5 5 === True
        , largeNumber = assert : subj.equal 1000 1000 === True
        }
      , differentNumbers =
        { zeroVsPositive = assert : subj.equal 0 1 === False
        , positiveVsZero = assert : subj.equal 1 0 === False
        , differentPositive = assert : subj.equal 3 7 === False
        , closeNumbers = assert : subj.equal 10 11 === False
        , largeNumbers = assert : subj.equal 999 1000 === False
        }
      }
    }
