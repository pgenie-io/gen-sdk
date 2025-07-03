let Self = ./Type.dhall

let Prelude = ../../Prelude.dhall

let def =
      \(self : Self) ->
        Prelude.Text.upperASCII self.firstChar ++ self.otherChars

let test =
      let uppers =
            assert : def { firstChar = "H", otherChars = "ello" } === "Hello"

      let itWorksOnSingleChar =
            assert : def { firstChar = "A", otherChars = "" } === "A"

      let supportsDigits =
            assert : def { firstChar = "1", otherChars = "23abc" } === "123abc"

      in  {}

in  def
