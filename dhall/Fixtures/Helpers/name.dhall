-- Helper to construct name easier.
-- In cases of incorrect input (empty lists), it produces a default name.
let Prelude = ../../Prelude.dhall

let Lude = ../../Lude.dhall

let CodegenKit = ../../CodegenKit.dhall

let LatinChar = Lude.Structures.LatinChar

let LatinChars = Lude.Structures.LatinChars

let Name = CodegenKit.Name

let LatinChars =
      let default
          : LatinChars.Type
          = { head = LatinChar.Type.Z, tail = [] : List LatinChar.Type }

      let fromList
          : List LatinChar.Type -> LatinChars.Type
          = \(list : List LatinChar.Type) ->
              merge
                { None = default
                , Some = Prelude.Function.identity LatinChars.Type
                }
                (Lude.Extensions.List.uncons LatinChar.Type list)

      in  LatinChars // { default, fromList }

in  \(charLists : List (List LatinChar.Type)) ->
      let words =
            Prelude.List.map
              (List LatinChar.Type)
              LatinChars.Type
              LatinChars.fromList
              charLists

      let unconsing = Lude.Extensions.List.uncons LatinChars.Type words

      let name =
            merge
              { None = Name.fromLatinChars LatinChars.default
              , Some =
                  \(nonEmpty : Prelude.NonEmpty.Type LatinChars.Type) ->
                    let nonEmpty =
                          Prelude.NonEmpty.map
                            LatinChars.Type
                            Name.Type
                            Name.fromLatinChars
                            nonEmpty

                    in  Name.concat nonEmpty.head nonEmpty.tail
              }
              unconsing

      in  name : Name.Type
