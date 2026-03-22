-- | The codegen API model. Used as input to generators.
let Prelude = ./Prelude.dhall

let CodegenKit = ./CodegenKit.dhall

let Version = { major : Natural, minor : Natural, patch : Natural }

let Name = CodegenKit.Name.Type

let Primitive =
    -- | PostgreSQL primitive type.
    --
    -- `Bit` - `bit` (OID 1560, array OID 1561).
    -- `Bool` - `bool` (OID 16, array OID 1000).
    -- `Box` - `box` (OID 603, array OID 1020).
    -- `Bpchar` - `bpchar` / `char(n)` (OID 1042, array OID 1014).
    -- `Bytea` - `bytea` (OID 17, array OID 1001).
    -- `Char` - internal single-byte `"char"` (OID 18, array OID 1002).
    -- `Cidr` - `cidr` (OID 650, array OID 651).
    -- `Circle` - `circle` (OID 718, array OID 719).
    -- `Citext` - `citext` (extension type).
    -- `Date` - `date` (OID 1082, array OID 1182).
    -- `Datemultirange` - `datemultirange` (OID 4535, array OID 6150).
    -- `Daterange` - `daterange` (OID 3912, array OID 3913).
    -- `Float4` - `float4` / `real` (OID 700, array OID 1021).
    -- `Float8` - `float8` / `double precision` (OID 701, array OID 1022).
    -- `Hstore` - `hstore` extension type (no fixed OID; requires the hstore extension).
    -- `Inet` - `inet` (OID 869, array OID 1041).
    -- `Int2` - `int2` / `smallint` (OID 21, array OID 1005).
    -- `Int4` - `int4` / `integer` (OID 23, array OID 1007).
    -- `Int4multirange` - `int4multirange` (OID 4451, array OID 6154).
    -- `Int4range` - `int4range` (OID 3904, array OID 3905).
    -- `Int8` - `int8` / `bigint` (OID 20, array OID 1016).
    -- `Int8multirange` - `int8multirange` (OID 4536, array OID 6157).
    -- `Int8range` - `int8range` (OID 3926, array OID 3927).
    -- `Interval` - `interval` (OID 1186, array OID 1187).
    -- `Json` - `json` (OID 114, array OID 199).
    -- `Jsonb` - `jsonb` (OID 3802, array OID 3807).
    -- `Line` - `line` (OID 628, array OID 629).
    -- `Lseg` - `lseg` (OID 601, array OID 1018).
    -- `Macaddr` - `macaddr` (OID 829, array OID 1040).
    -- `Macaddr8` - `macaddr8` (OID 774, array OID 775).
    -- `Money` - `money` (OID 790, array OID 791).
    -- `Name` - `name` (OID 19, array OID 1003).
    -- `Numeric` - `numeric` (OID 1700, array OID 1231).
    -- `Nummultirange` - `nummultirange` (OID 4532, array OID 6151).
    -- `Numrange` - `numrange` (OID 3906, array OID 3907).
    -- `Oid` - `oid` (PostgreSQL object identifier type).
    -- `Path` - `path` (OID 602, array OID 1019).
    -- `PgLsn` - `pg_lsn` (OID 3220, array OID 3221).
    -- `PgSnapshot` - `pg_snapshot` (OID 5038, array OID 5039).
    -- `Point` - `point` (OID 600, array OID 1017).
    -- `Polygon` - `polygon` (OID 604, array OID 1027).
    -- `Text` - `text` (OID 25, array OID 1009).
    -- `Time` - `time` (OID 1083, array OID 1183).
    -- `Timestamp` - `timestamp` (OID 1114, array OID 1115).
    -- `Timestamptz` - `timestamptz` (OID 1184, array OID 1185).
    -- `Timetz` - `timetz` (OID 1266, array OID 1270).
    -- `Tsmultirange` - `tsmultirange` (OID 4533, array OID 6152).
    -- `Tsquery` - `tsquery` (OID 3615, array OID 3645).
    -- `Tsrange` - `tsrange` (OID 3908, array OID 3909).
    -- `Tstzmultirange` - `tstzmultirange` (OID 4534, array OID 6153).
    -- `Tstzrange` - `tstzrange` (OID 3910, array OID 3911).
    -- `Tsvector` - `tsvector` (OID 3614, array OID 3643).
    -- `Uuid` - `uuid` (OID 2950, array OID 2951).
    -- `Varbit` - `varbit` (OID 1562, array OID 1563).
    -- `Varchar` - `varchar` / `character varying` (OID 1043, array OID 1015).
    -- `Xml` - `xml` (OID 142, array OID 143).

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

let Migration = { srcPath : Text, sql : Text }

let Project =
      { space : Name
      , name : Name
      , version : Version
      , customTypes : List CustomType
      , queries : List Query
      , migrations : List Migration
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
