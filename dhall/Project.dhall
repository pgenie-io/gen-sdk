-- | The codegen API model. Used as input to generators.
let Prelude = ./Prelude.dhall

let CodegenKit = ./CodegenKit.dhall

let Version = { major : Natural, minor : Natural, patch : Natural }

let Name = CodegenKit.Name.Type

let Primitive =
      < Bit
      | Bool
      | Box
      | Bpchar
      | Bytea
      | Char
      | Cidr
      | Circle
      | Citext
      | Date
      | Datemultirange
      | Daterange
      | Float4
      | Float8
      | Hstore
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
      | Line
      | Lseg
      | Macaddr
      | Macaddr8
      | Money
      | Name
      | Numeric
      | Nummultirange
      | Numrange
      | Oid
      | Path
      | PgLsn
      | PgSnapshot
      | Point
      | Polygon
      | Text
      | Time
      | Timestamp
      | Timestamptz
      | Timetz
      | Tsmultirange
      | Tsquery
      | Tsrange
      | Tstzmultirange
      | Tstzrange
      | Tsvector
      | Uuid
      | Varbit
      | Varchar
      | Xml
      >

let Scalar = < Primitive : Primitive | Custom : Name >

let ArraySettings = { dimensionality : Natural, elementIsNullable : Bool }

let Value = { arraySettings : Optional ArraySettings, scalar : Scalar }

let Member = { name : Name, pgName : Text, isNullable : Bool, value : Value }

let EnumVariant = { name : Name, pgName : Text }

let CustomTypeDefinition =
      < Composite : List Member | Enum : List EnumVariant | Domain : Value >

let CustomType =
      { name : Name
      , pgSchema : Text
      , pgName : Text
      , definition : CustomTypeDefinition
      }

let ResultRowsCardinality = < Optional | Single | Multiple >

let ResultRows =
      { cardinality : ResultRowsCardinality
      , columns : Prelude.NonEmpty.Type Member
      }

let Result = Optional ResultRows

let Var = { name : Name, rawName : Text, paramIndex : Natural }

let QueryFragment = < Sql : Text | Var : Var >

let QueryFragments = List QueryFragment

let Query =
      { name : Name
      , srcPath : Text
      , params : List Member
      , result : Result
      , fragments : QueryFragments
      }

let Project =
      { space : Name
      , name : Name
      , version : Version
      , customTypes : List CustomType
      , queries : List Query
      }

let Primitive/toText
    : Primitive -> Text
    = let handler =
            { Bit = "bit"
            , Bool = "bool"
            , Box = "box"
            , Bpchar = "bpchar"
            , Bytea = "bytea"
            , Char = "char"
            , Cidr = "cidr"
            , Circle = "circle"
            , Citext = "citext"
            , Date = "date"
            , Datemultirange = "datemultirange"
            , Daterange = "daterange"
            , Float4 = "float4"
            , Float8 = "float8"
            , Hstore = "hstore"
            , Inet = "inet"
            , Int2 = "int2"
            , Int4 = "int4"
            , Int4multirange = "int4multirange"
            , Int4range = "int4range"
            , Int8 = "int8"
            , Int8multirange = "int8multirange"
            , Int8range = "int8range"
            , Interval = "interval"
            , Json = "json"
            , Jsonb = "jsonb"
            , Line = "line"
            , Lseg = "lseg"
            , Macaddr = "macaddr"
            , Macaddr8 = "macaddr8"
            , Money = "money"
            , Name = "name"
            , Numeric = "numeric"
            , Nummultirange = "nummultirange"
            , Numrange = "numrange"
            , Oid = "oid"
            , Path = "path"
            , PgLsn = "pg_lsn"
            , PgSnapshot = "pg_snapshot"
            , Point = "point"
            , Polygon = "polygon"
            , Text = "text"
            , Time = "time"
            , Timestamp = "timestamp"
            , Timestamptz = "timestamptz"
            , Timetz = "timetz"
            , Tsmultirange = "tsmultirange"
            , Tsquery = "tsquery"
            , Tsrange = "tsrange"
            , Tstzmultirange = "tstzmultirange"
            , Tstzrange = "tstzrange"
            , Tsvector = "tsvector"
            , Uuid = "uuid"
            , Varbit = "varbit"
            , Varchar = "varchar"
            , Xml = "xml"
            }

      in  \(primitive : Primitive) -> merge handler primitive

in  { Project
    , Version
    , Name
    , Primitive
    , Primitive/toText
    , Scalar
    , ArraySettings
    , Value
    , EnumVariant
    , CustomTypeDefinition
    , CustomType
    , Member
    , ResultRowsCardinality
    , ResultRows
    , Result
    , Var
    , QueryFragment
    , QueryFragments
    , Query
    }
