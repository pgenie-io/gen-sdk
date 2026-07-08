let Lude = ../Deps/Lude.dhall

let module =
      \(Config : Type) ->
      \(Input : Type) ->
      \(Output : Type) ->
        let Result = Lude.Compiled.Type Output

        let Run = Config -> Input -> Result

        in  \(run : Run) -> { Input, Output, Result, Run, run }

in  { module }
