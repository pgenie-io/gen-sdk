let Contract = ../Deps/Contract.dhall

in  { supportedCustomTypes = ./supportedCustomTypes.dhall
    , supportedCustomTypesReasoned = ./supportedCustomTypesReasoned.dhall
    , customTypeIsSupported = ./customTypeIsSupported.dhall
    , queryIsSupported = ./queryIsSupported.dhall
    }
