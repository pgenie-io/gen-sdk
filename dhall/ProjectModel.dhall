let Prelude = ./Prelude.dhall

let Version = { major : Natural, minor : Natural, patch : Natural }

let Name = ./StrictName/Type.dhall

let Primitive =
      < Bool
      | Bytea
      | Char
      | Cidr
      | Date
      | Datemultirange
      | Daterange
      | Float4
      | Float8
      | Inet
      | Int2
      | Int4
      | Int4multirange
      | Int4range
      | Int8
      | Int8multirange
      | Int8range
      | Interval
      | Json
      | Jsonb
      | Macaddr
      | Macaddr8
      | Money
      | Numeric
      | Nummultirange
      | Numrange
      | Text
      | Time
      | Timestamp
      | Timestamptz
      | Timetz
      | Tsmultirange
      | Tsrange
      | Tstzmultirange
      | Tstzrange
      | Uuid
      | Xml
      >

let Scalar = < Primitive : Primitive | Custom : Name >

let Dimensional = { dimensionality : Natural, scalar : Scalar }

let Value = { isNullable : Bool, dimensional : Dimensional }

let CompositeField = { name : Name, pgName : Text, definition : Value }

let EnumVariant = { name : Name, pgName : Text }

let CustomTypeDefinition =
      < Composite : List CompositeField
      | Enum : List EnumVariant
      | Domain : Dimensional
      >

let CustomType =
      { name : Name, pgName : Text, definition : CustomTypeDefinition }

let Field = { name : Name, type : Value }

let QueryFragment = < Sql : Text | Var : Name >

let Query =
      { name : Name
      , srcPath : Text
      , params : List Field
      , result :
          Optional
            { category : < Optional | Single | Mutliple >
            , row : Prelude.NonEmpty.Type Field
            }
      , fragments : List QueryFragment
      }

let Project =
      { name : Name
      , version : Version
      , customTypes : List CustomType
      , queries : List Query
      }

in  { Project
    , Version
    , Name
    , Primitive
    , Scalar
    , Dimensional
    , Value
    , CompositeField
    , EnumVariant
    , CustomTypeDefinition
    , CustomType
    , Field
    , QueryFragment
    , Query
    }
