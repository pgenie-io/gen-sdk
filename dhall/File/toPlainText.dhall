-- Rendering for inspection purposes.
let Prelude = ../Prelude.dhall

let Lude = ../Lude.dhall

let File = ./Type.dhall

in  \(file : File) ->
      Lude.Extensions.Text.indent 2 (file.path ++ ":" ++ "\n\n" ++ file.content)
