let Contract = ./Deps/Contract.dhall

in  { Project = Contract
    , module = Contract.module
    , Fixtures = ./Fixtures/package.dhall
    , Sigs = ./Sigs/package.dhall
    , Primitive/toText = ./Primitive/toText.dhall
    }
