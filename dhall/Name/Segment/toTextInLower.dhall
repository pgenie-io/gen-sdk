let Self = ./Type.dhall

let Prelude = ../../Prelude.dhall

let def =
      \(self : Self) ->
        Prelude.Text.lowerASCII self.firstChar ++ self.otherChars

let test =
      let lowers =
            assert : def { firstChar = "H", otherChars = "ello" } === "hello"

      let itWorksOnSingleChar =
            assert : def { firstChar = "A", otherChars = "" } === "a"

      let supportsDigits =
            assert : def { firstChar = "1", otherChars = "23abc" } === "123abc"

      in  {}

in  def
