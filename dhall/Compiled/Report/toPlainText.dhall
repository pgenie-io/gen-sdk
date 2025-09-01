let Prelude = ../../Prelude.dhall

let Report = ./Type.dhall

in  \(report : Report) ->
      ''
      - Warning: ${report.message}
        Context: ${Prelude.Text.concatMap
                     Text
                     (\(segment : Text) -> "\n" ++ "    - " ++ segment)
                     report.path}
      ''
