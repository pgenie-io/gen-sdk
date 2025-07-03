let subj = ./toTextInUpper.dhall

in  { itUppers =
        assert : subj { firstChar = "h", otherChars = "ello" } === "Hello"
    , itWorksOnSingleChar =
        assert : subj { firstChar = "a", otherChars = "" } === "A"
    , itSupportsDigits =
        assert : subj { firstChar = "1", otherChars = "23abc" } === "123abc"
    }
