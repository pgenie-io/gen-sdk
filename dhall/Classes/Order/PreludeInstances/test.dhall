let Prelude = ../Prelude.dhall

let Order = ../Type.dhall

let Comparison = ../Comparison.dhall

let PreludeInstances = ./package.dhall

in  { natural = ./natural.test.dhall
    , list = ./list.test.dhall
    , nonEmpty = ./nonEmpty.test.dhall
    }
