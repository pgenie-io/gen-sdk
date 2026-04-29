let Prelude = ../Deps/Prelude.dhall

let Files = ./Type.dhall

let File = ../File/package.dhall

in    Prelude.Text.concatMapSep
        ''

        ---
        ''
        File.Type
        File.toPlainText
    : Files -> Text
