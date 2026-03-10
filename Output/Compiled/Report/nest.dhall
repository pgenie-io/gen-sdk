let Report = ./Type.dhall

in  \(context : Text) ->
    \(report : Report) ->
      { path = [ context ] # report.path, message = report.message }
