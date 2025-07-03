let Self = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(self : Self) -> Prelude.Text.upperASCII self.firstChar ++ self.otherChars
