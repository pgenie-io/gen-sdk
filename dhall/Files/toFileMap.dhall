let Prelude = ../Prelude.dhall

let Files = ./Type.dhall

let File = ../File/package.dhall

in    Prelude.List.map
        File.Type
        (Prelude.Map.Entry Text Text)
        (\(file : File.Type) -> { mapKey = file.path, mapValue = file.content })
    : Files -> Prelude.Map.Type Text Text
