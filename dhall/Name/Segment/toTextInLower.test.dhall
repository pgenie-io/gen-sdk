let subj = ./toTextInLower.dhall

in  { itLowers =
        assert : subj { firstChar = "H", otherChars = "ello" } === "hello"
    , itWorksOnSingleChar =
        assert : subj { firstChar = "A", otherChars = "" } === "a"
    , itSupportsDigits =
        assert : subj { firstChar = "1", otherChars = "23abc" } === "123abc"
    }
