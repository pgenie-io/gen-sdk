let Prelude = ../Prelude.dhall

let File = ./Type.dhall

in  \(file : File) ->
      Prelude.Map.keyText file.path file.content : Prelude.Map.Entry Text Text
