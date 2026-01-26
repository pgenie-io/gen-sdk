let Prelude = ../../Prelude.dhall

let Report = ./Type.dhall

in  \(level : Text) ->
    \(report : Report) ->
      ''
      - ${level}: ${report.message}
        Context: ${Prelude.Text.concatMap
                     Text
                     (\(segment : Text) -> "\n" ++ "    - " ++ segment)
                     report.path}
      ''
