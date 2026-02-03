let Prelude = ../Prelude.dhall

let Compiled = ./Type.dhall

let Report = ./Report/package.dhall

let toWarningsYaml = ./toWarningsYaml.dhall

let Files = Prelude.Map.Type Text Text

in  \(compiledFiles : Compiled Files) ->
      let warningsYaml
          : Optional Text
          = toWarningsYaml Files compiledFiles

      let optionalToFiles
          : Text -> Optional Text -> Files
          = \(path : Text) ->
            \(optionalContent : Optional Text) ->
              merge
                { None = Prelude.Map.empty Text Text
                , Some =
                    \(content : Text) -> [ Prelude.Map.keyText path content ]
                }
                optionalContent

      let files
          : Files
          =   optionalToFiles "pgenie-warnings.yaml" warningsYaml
            # merge
                { Ok = \(ok : Files) -> ok
                , Err =
                    \(err : Report.Type) ->
                      [ Prelude.Map.keyText
                          "pgenie-error.yaml"
                          (Report.toPlainText "Error" err)
                      ]
                }
                compiledFiles.result

      in  files
