let Prelude = ../Prelude.dhall

let Equality = ../Type.dhall

let PreludeInstances = ./package.dhall

in  { natural = ./natural.test.dhall
    , list = ./list.test.dhall
    , nonEmpty = ./nonEmpty.test.dhall
    }
