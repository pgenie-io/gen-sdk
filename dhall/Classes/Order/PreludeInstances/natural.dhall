let Prelude = ../../Prelude.dhall

let Equality = ../../Equality/package.dhall

let Order = ../Type.dhall

in    { equality = Equality.PreludeInstances.natural
      , lessThan = Prelude.Natural.lessThan
      }
    : Order Natural
