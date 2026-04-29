-- Function for constructing standard Codegen modules.
-- Takes a contract version, a config type, and a compile function,
-- and returns a module with those components.
let Prelude = ./Deps/Prelude.dhall

let Lude = ./Deps/Lude.dhall

let Project = ./Project.dhall

let File = ./File/package.dhall

let Files = ./Files/package.dhall

let ContractVersion = ./ContractVersion.dhall

in  \(contractVersion : ContractVersion) ->
    \(Config : Type) ->
    \ ( compile
      : Optional Config ->
        Project.Project ->
          Lude.Compiled.Type (List File.Type)
      ) ->
      let compileToFileMap
          -- Helper for immediately compiling a project to a file map.
          : Optional Config -> Project.Project -> Prelude.Map.Type Text Text
          = \(config : Optional Config) ->
            \(project : Project.Project) ->
              let compiledFiles = compile config project

              let compiledFileMap =
                    Lude.Compiled.map
                      Files.Type
                      (Prelude.Map.Type Text Text)
                      Files.toFileMap
                      compiledFiles

              let fileMap = Lude.Compiled.toFileMap compiledFileMap

              in  fileMap

      in  { contractVersion, Config, compile, compileToFileMap }
