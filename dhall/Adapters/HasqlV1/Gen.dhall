let Sdk = ./Sdk.dhall

let Config = ./Config.dhall

let generate = ./Generate/package.dhall

in  Sdk.Gen.Gen Config generate
