let Imports =
      { Prelude = ./Prelude.dhall, StrictName = ./StrictName/package.dhall }

let Version = { major : Natural, minor : Natural, patch : Natural }

let Name = Imports.StrictName.Type

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

let TypeSig = { isNullable : Bool, dimensional : Dimensional }

let CompositeField = { name : Name, pgName : Text, definition : TypeSig }

let EnumVariant = { name : Name, pgName : Text }

let CustomTypeDefinition =
      < Composite : List CompositeField
      | Enum : List EnumVariant
      | Domain : Dimensional
      >

let CustomType =
      { name : Name, pgName : Text, definition : CustomTypeDefinition }

let Project = { name : Name, version : Version, customTypes : List CustomType }

in  { Project
    , Version
    , Name
    , Primitive
    , Scalar
    , Dimensional
    , TypeSig
    , CompositeField
    , EnumVariant
    , CustomTypeDefinition
    , CustomType
    }
