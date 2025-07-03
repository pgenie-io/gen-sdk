let Self = ./Type.dhall

let Prelude = ../../Prelude.dhall

in  \(self : Self) -> Prelude.Text.lowerASCII self.firstChar ++ self.otherChars
