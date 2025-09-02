let Prelude = ../../Prelude.dhall

let Lude = ../../Lude.dhall

let CodegenKit = ../../CodegenKit.dhall

let LatinChar = Lude.Structures.LatinChar

let LatinChars = Lude.Structures.LatinChars

let Name = CodegenKit.Name

let Project = ../../Project.dhall

let name = ./name.dhall

in  \(paramIndex : Natural) ->
    \(nameCharLists : List (List LatinChar.Type)) ->
      let name
          : Name.Type
          = name nameCharLists

      let rawName
          : Text
          = Name.toTextInSnake name

      in    Project.QueryFragment.Var { name, rawName, paramIndex }
          : Project.QueryFragment
