-- | Signature for a standard pGenie generator interpreter.
--
-- An interpreter takes a config and the project input and returns a result
-- that is either success with warnings and generated files, or an error
-- report.
let Report = { path : List Text, message : Text }

let module =
      \(Config : Type) ->
      \(Input : Type) ->
      \(Output : Type) ->
        let Result =
              < Ok : { warnings : List Report, value : Output } | Err : Report >

        let Run = Config -> Input -> Result

        in  \(run : Run) -> { Input, Output, Result, Run, run }

in  { module }
