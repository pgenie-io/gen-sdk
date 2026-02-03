-- Possibly successful result of compilation accompanied by a list of warnings.
--
-- When the result is present, the reports can be interpreted as warnings,
-- when absent, they indicate errors.
let Report = ./Report/Type.dhall

let Result = ./Result/Type.dhall

in  \(A : Type) -> { warnings : List Report, result : Result A }
