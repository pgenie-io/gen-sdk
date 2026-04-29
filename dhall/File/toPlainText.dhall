-- Rendering for inspection purposes.
let Lude = ../Deps/Lude.dhall

let File = ./Type.dhall

in  \(file : File) ->
      Lude.Text.indent 2 (file.path ++ ":" ++ "\n\n" ++ file.content)
