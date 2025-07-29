let Prelude = ./Prelude.dhall

let Project = ./Project.dhall

let Error =
      { path : List Text
      , -- What happened
        description : Text
      , input : Text
      }

let Warning =
      < QuerySkipped : { query : Project.Query, dueTo : Error }
      | GeneratorWarning : Text
      >

let File = { path : Text, content : Text }

let Result = { warnings : List Warning, files : List File }

let Generate
    : Type -> Type
    = \(Config : Type) -> Config -> Project.Project -> Result

let Gen =
      \(Config : Type) ->
      \(generate : Generate Config) ->
        { Config, Project, generate }

let Result/empty
    : Result
    = { warnings = Prelude.List.empty Warning, files = Prelude.List.empty File }

let Result/prepend
    : forall (prefix : Result) -> forall (suffix : Result) -> Result
    = \(prefix : Result) ->
      \(suffix : Result) ->
        { warnings =
            Prelude.List.concat Warning [ prefix.warnings, suffix.warnings ]
        , files = Prelude.List.concat File [ prefix.files, suffix.files ]
        }

let Result/concat
    : List Result -> Result
    = \(input : List Result) ->
        Prelude.List.fold Result input Result Result/prepend Result/empty

let Result/fromFiles
    : List File -> Result
    = \(files : List File) -> { warnings = Prelude.List.empty Warning, files }

in  { Project
    , Warning
    , Error
    , File
    , Generate
    , Gen
    , Result
    , Result/concat
    , Result/fromFiles
    }
