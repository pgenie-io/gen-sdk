let Report = ./Type.dhall

in  \(message : Text) -> { path = [] : List Text, message } : Report
