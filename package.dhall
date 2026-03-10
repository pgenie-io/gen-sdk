{ ContractVersion = ./ContractVersion.dhall
, Input = ./Input/package.dhall
, Output =
  { Compiled = ./Output/Compiled/package.dhall
  , Files = ./Output/Files/package.dhall
  , File = ./Output/File/package.dhall
  }
, Fixtures = ./Fixtures/package.dhall
, module = ./module.dhall
}
