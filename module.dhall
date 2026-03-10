-- Function for constructing standard Codegen modules.
-- Takes a contract version, a config type, and a compile function,
-- and returns a module with those components.
let Project = ./Input/package.dhall

let Compiled = ./Output/Compiled/package.dhall

let File = ./Output/File/package.dhall

let ContractVersion = ./ContractVersion.dhall

in  \(contractVersion : ContractVersion) ->
    \(Config : Type) ->
    \ ( compile
      : Optional Config -> Project.Project -> Compiled.Type (List File.Type)
      ) ->
      { contractVersion, Config, compile }
