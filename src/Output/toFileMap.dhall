let Prelude = ../Deps/Prelude.dhall

let Lude = ../Deps/Lude.dhall

let Contract = ../Deps/Contract.dhall

in  \(output : Contract.Output) ->
      Lude.Compiled.toFileMap
        ( Lude.Compiled.map
            (List Contract.File)
            (Prelude.Map.Type Text Text)
            Lude.Files.toFileMap
            output
        )
