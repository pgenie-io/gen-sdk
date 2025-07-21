let Prelude = ../Prelude.dhall

let Classes = ../../Classes/package.dhall

let Arbitrary = Classes.Arbitrary

let Lude = ../../Lude/package.dhall

in  \(Element : Type) ->
    \(elementInstance : Arbitrary.Type Element) ->
      let generate
          : Natural -> Natural -> List Element
          = \(iteration : Natural) ->
            \(depth : Natural) ->
              let size = Lude.Natural.div iteration depth

              in  Prelude.List.generate
                    size
                    Element
                    ( \(index : Natural) ->
                        elementInstance.generate
                          (size + index)
                          (Prelude.Natural.subtract 1 depth)
                    )

      in  { generate } : Arbitrary.Type (List Element)
