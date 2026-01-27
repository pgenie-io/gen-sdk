-- Function for constructing Generator modules.
let Project = ./Project.dhall

let Compiled = ./Compiled/package.dhall

let File = ./File/package.dhall

in  \(Config : Type) ->
    \(generate : Config -> Project.Project -> Compiled.Type (List File.Type)) ->
      { Config, generate }
