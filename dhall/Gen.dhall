let Prelude = ./Prelude.dhall

let Project = ./Project.dhall

let ValueError =
      < UnsupportedPrimitive : Project.Primitive
      | UnsupportedDimensionality : Natural
      | Custom : Text
      >

let FieldError = { name : Project.Name, dueTo : ValueError }

let QueryError =
      < Param : FieldError
      | ResultColumn : FieldError
      | GeneratorFailure : Text
      >

let Warning =
      < QuerySkipped : { query : Project.Query, dueTo : QueryError }
      | GeneratorWarning : Text
      >

let File = { path : Text, content : Text }

let Success = { warnings : List Warning, files : List File }

let Result = < Failure : Text | Success : Success >

let Generate
    : Type -> Type
    = \(Config : Type) -> Config -> Project.Project -> Result

let Gen =
      \(Config : Type) ->
      \(generate : Generate Config) ->
        { Config, Project, generate }

let Result/empty
    : Result
    = Result.Success
        { warnings = Prelude.List.empty Warning
        , files = Prelude.List.empty File
        }

let Result/prepend
    : forall (prefix : Result) -> forall (suffix : Result) -> Result
    = \(prefix : Result) ->
      \(suffix : Result) ->
        merge
          { Failure = \(msg : Text) -> Result.Failure msg
          , Success =
              \(prefix : Success) ->
                merge
                  { Failure = \(msg : Text) -> Result.Failure msg
                  , Success =
                      \(suffix : Success) ->
                        Result.Success
                          { warnings =
                              Prelude.List.concat
                                Warning
                                [ prefix.warnings, suffix.warnings ]
                          , files =
                              Prelude.List.concat
                                File
                                [ prefix.files, suffix.files ]
                          }
                  }
                  suffix
          }
          prefix

let Result/concat
    : List Result -> Result
    = \(input : List Result) ->
        Prelude.List.fold Result input Result Result/prepend Result/empty

in  { Project
    , Warning
    , ValueError
    , FieldError
    , QueryError
    , File
    , Result
    , Generate
    , Gen
    , Result/concat
    }
