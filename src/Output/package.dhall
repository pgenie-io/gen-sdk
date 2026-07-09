let Prelude = ../Deps/Prelude.dhall

let Contract = ../Deps/Contract.dhall

let toFileMap
    : Contract.Output -> Prelude.Map.Type Text Text
    = ./toFileMap.dhall

in  { toFileMap }
