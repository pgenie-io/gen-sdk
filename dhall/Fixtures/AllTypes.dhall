let Project = ../Project.dhall

let Name = Project.Name

let name
    : Text -> Text -> Text -> Text -> Text -> Text -> Text -> Text -> Name
    = \(inCamelCase : Text) ->
      \(inPascalCase : Text) ->
      \(inKebabCase : Text) ->
      \(inTrainCase : Text) ->
      \(inScreamingKebabCase : Text) ->
      \(inSnakeCase : Text) ->
      \(inCamelSnakeCase : Text) ->
      \(inScreamingSnakeCase : Text) ->
        { inCamelCase
        , inPascalCase
        , inKebabCase
        , inTrainCase
        , inScreamingKebabCase
        , inSnakeCase
        , inCamelSnakeCase
        , inScreamingSnakeCase
        }

let query =
      let paramName =
            name "param" "Param" "param" "Param" "PARAM" "param" "Param" "PARAM"

      let member =
            \(name : Name) ->
            \(pgName : Text) ->
            \(primitive : Project.Primitive) ->
              { name
              , pgName
              , isNullable = False
              , value =
                { arraySettings = None Project.ArraySettings
                , scalar = Project.Scalar.Primitive primitive
                }
              }

      in  \(primitive : Project.Primitive) ->
          \(inCamelCase : Text) ->
          \(inPascalCase : Text) ->
          \(inKebabCase : Text) ->
          \(inTrainCase : Text) ->
          \(inScreamingKebabCase : Text) ->
          \(inSnakeCase : Text) ->
          \(inCamelSnakeCase : Text) ->
          \(inScreamingSnakeCase : Text) ->
            let primitiveName =
                  name
                    inCamelCase
                    inPascalCase
                    inKebabCase
                    inTrainCase
                    inScreamingKebabCase
                    inSnakeCase
                    inCamelSnakeCase
                    inScreamingSnakeCase

            in  { name =
                    name
                      ("select" ++ inPascalCase)
                      ("Select" ++ inPascalCase)
                      ("select-" ++ inKebabCase)
                      ("Select-" ++ inTrainCase)
                      ("SELECT-" ++ inScreamingKebabCase)
                      ("select_" ++ inSnakeCase)
                      ("Select_" ++ inCamelSnakeCase)
                      ("SELECT_" ++ inScreamingSnakeCase)
                , srcPath = "./queries/select_" ++ inSnakeCase ++ ".sql"
                , idempotent = True
                , params = [ member paramName "param" primitive ]
                , result = Some
                  { cardinality = Project.ResultRowsCardinality.Multiple
                  , columns =
                    { head = member primitiveName inSnakeCase primitive
                    , tail = [] : List Project.Member
                    }
                  }
                , fragments =
                  [ Project.QueryFragment.Sql "select "
                  , Project.QueryFragment.Var
                      { name = paramName, rawName = "param", paramIndex = 0 }
                  , Project.QueryFragment.Sql ("::" ++ inSnakeCase)
                  ]
                }

in  { space =
        name
          "mySpace"
          "MySpace"
          "my-space"
          "My-Space"
          "MY-SPACE"
          "my_space"
          "My_Space"
          "MY_SPACE"
    , name =
        name
          "musicCatalogue"
          "MusicCatalogue"
          "music-catalogue"
          "Music-Catalogue"
          "MUSIC-CATALOGUE"
          "music_catalogue"
          "Music_Catalogue"
          "MUSIC_CATALOGUE"
    , version = { major = 1, minor = 0, patch = 1 }
    , customTypes = [] : List Project.CustomType
    , queries =
      [ query
          Project.Primitive.Bit
          "bit"
          "Bit"
          "bit"
          "Bit"
          "BIT"
          "bit"
          "Bit"
          "BIT"
      , query
          Project.Primitive.Bool
          "bool"
          "Bool"
          "bool"
          "Bool"
          "BOOL"
          "bool"
          "Bool"
          "BOOL"
      , query
          Project.Primitive.Box
          "box"
          "Box"
          "box"
          "Box"
          "BOX"
          "box"
          "Box"
          "BOX"
      , query
          Project.Primitive.Bpchar
          "bpchar"
          "Bpchar"
          "bpchar"
          "Bpchar"
          "BPCHAR"
          "bpchar"
          "Bpchar"
          "BPCHAR"
      , query
          Project.Primitive.Bytea
          "bytea"
          "Bytea"
          "bytea"
          "Bytea"
          "BYTEA"
          "bytea"
          "Bytea"
          "BYTEA"
      , query
          Project.Primitive.Char
          "char"
          "Char"
          "char"
          "Char"
          "CHAR"
          "char"
          "Char"
          "CHAR"
      , query
          Project.Primitive.Cidr
          "cidr"
          "Cidr"
          "cidr"
          "Cidr"
          "CIDR"
          "cidr"
          "Cidr"
          "CIDR"
      , query
          Project.Primitive.Circle
          "circle"
          "Circle"
          "circle"
          "Circle"
          "CIRCLE"
          "circle"
          "Circle"
          "CIRCLE"
      , query
          Project.Primitive.Citext
          "citext"
          "Citext"
          "citext"
          "Citext"
          "CITEXT"
          "citext"
          "Citext"
          "CITEXT"
      , query
          Project.Primitive.Date
          "date"
          "Date"
          "date"
          "Date"
          "DATE"
          "date"
          "Date"
          "DATE"
      , query
          Project.Primitive.Datemultirange
          "datemultirange"
          "Datemultirange"
          "datemultirange"
          "Datemultirange"
          "DATEMULTIRANGE"
          "datemultirange"
          "Datemultirange"
          "DATEMULTIRANGE"
      , query
          Project.Primitive.Daterange
          "daterange"
          "Daterange"
          "daterange"
          "Daterange"
          "DATERANGE"
          "daterange"
          "Daterange"
          "DATERANGE"
      , query
          Project.Primitive.Float4
          "float4"
          "Float4"
          "float4"
          "Float4"
          "FLOAT4"
          "float4"
          "Float4"
          "FLOAT4"
      , query
          Project.Primitive.Float8
          "float8"
          "Float8"
          "float8"
          "Float8"
          "FLOAT8"
          "float8"
          "Float8"
          "FLOAT8"
      , query
          Project.Primitive.Hstore
          "hstore"
          "Hstore"
          "hstore"
          "Hstore"
          "HSTORE"
          "hstore"
          "Hstore"
          "HSTORE"
      , query
          Project.Primitive.Inet
          "inet"
          "Inet"
          "inet"
          "Inet"
          "INET"
          "inet"
          "Inet"
          "INET"
      , query
          Project.Primitive.Int2
          "int2"
          "Int2"
          "int2"
          "Int2"
          "INT2"
          "int2"
          "Int2"
          "INT2"
      , query
          Project.Primitive.Int4
          "int4"
          "Int4"
          "int4"
          "Int4"
          "INT4"
          "int4"
          "Int4"
          "INT4"
      , query
          Project.Primitive.Int4multirange
          "int4multirange"
          "Int4multirange"
          "int4multirange"
          "Int4multirange"
          "INT4MULTIRANGE"
          "int4multirange"
          "Int4multirange"
          "INT4MULTIRANGE"
      , query
          Project.Primitive.Int4range
          "int4range"
          "Int4range"
          "int4range"
          "Int4range"
          "INT4RANGE"
          "int4range"
          "Int4range"
          "INT4RANGE"
      , query
          Project.Primitive.Int8
          "int8"
          "Int8"
          "int8"
          "Int8"
          "INT8"
          "int8"
          "Int8"
          "INT8"
      , query
          Project.Primitive.Int8multirange
          "int8multirange"
          "Int8multirange"
          "int8multirange"
          "Int8multirange"
          "INT8MULTIRANGE"
          "int8multirange"
          "Int8multirange"
          "INT8MULTIRANGE"
      , query
          Project.Primitive.Int8range
          "int8range"
          "Int8range"
          "int8range"
          "Int8range"
          "INT8RANGE"
          "int8range"
          "Int8range"
          "INT8RANGE"
      , query
          Project.Primitive.Interval
          "interval"
          "Interval"
          "interval"
          "Interval"
          "INTERVAL"
          "interval"
          "Interval"
          "INTERVAL"
      , query
          Project.Primitive.Json
          "json"
          "Json"
          "json"
          "Json"
          "JSON"
          "json"
          "Json"
          "JSON"
      , query
          Project.Primitive.Jsonb
          "jsonb"
          "Jsonb"
          "jsonb"
          "Jsonb"
          "JSONB"
          "jsonb"
          "Jsonb"
          "JSONB"
      , query
          Project.Primitive.Line
          "line"
          "Line"
          "line"
          "Line"
          "LINE"
          "line"
          "Line"
          "LINE"
      , query
          Project.Primitive.Lseg
          "lseg"
          "Lseg"
          "lseg"
          "Lseg"
          "LSEG"
          "lseg"
          "Lseg"
          "LSEG"
      , query
          Project.Primitive.Ltree
          "ltree"
          "Ltree"
          "ltree"
          "Ltree"
          "LTREE"
          "ltree"
          "Ltree"
          "LTREE"
      , query
          Project.Primitive.Macaddr
          "macaddr"
          "Macaddr"
          "macaddr"
          "Macaddr"
          "MACADDR"
          "macaddr"
          "Macaddr"
          "MACADDR"
      , query
          Project.Primitive.Macaddr8
          "macaddr8"
          "Macaddr8"
          "macaddr8"
          "Macaddr8"
          "MACADDR8"
          "macaddr8"
          "Macaddr8"
          "MACADDR8"
      , query
          Project.Primitive.Money
          "money"
          "Money"
          "money"
          "Money"
          "MONEY"
          "money"
          "Money"
          "MONEY"
      , query
          Project.Primitive.Name
          "name"
          "Name"
          "name"
          "Name"
          "NAME"
          "name"
          "Name"
          "NAME"
      , query
          Project.Primitive.Numeric
          "numeric"
          "Numeric"
          "numeric"
          "Numeric"
          "NUMERIC"
          "numeric"
          "Numeric"
          "NUMERIC"
      , query
          Project.Primitive.Nummultirange
          "nummultirange"
          "Nummultirange"
          "nummultirange"
          "Nummultirange"
          "NUMMULTIRANGE"
          "nummultirange"
          "Nummultirange"
          "NUMMULTIRANGE"
      , query
          Project.Primitive.Numrange
          "numrange"
          "Numrange"
          "numrange"
          "Numrange"
          "NUMRANGE"
          "numrange"
          "Numrange"
          "NUMRANGE"
      , query
          Project.Primitive.Oid
          "oid"
          "Oid"
          "oid"
          "Oid"
          "OID"
          "oid"
          "Oid"
          "OID"
      , query
          Project.Primitive.Path
          "path"
          "Path"
          "path"
          "Path"
          "PATH"
          "path"
          "Path"
          "PATH"
      , query
          Project.Primitive.PgLsn
          "pgLsn"
          "PgLsn"
          "pg-lsn"
          "Pg-Lsn"
          "PG-LSN"
          "pg_lsn"
          "Pg_Lsn"
          "PG_LSN"
      , query
          Project.Primitive.PgSnapshot
          "pgSnapshot"
          "PgSnapshot"
          "pg-snapshot"
          "Pg-Snapshot"
          "PG-SNAPSHOT"
          "pg_snapshot"
          "Pg_Snapshot"
          "PG_SNAPSHOT"
      , query
          Project.Primitive.Point
          "point"
          "Point"
          "point"
          "Point"
          "POINT"
          "point"
          "Point"
          "POINT"
      , query
          Project.Primitive.Polygon
          "polygon"
          "Polygon"
          "polygon"
          "Polygon"
          "POLYGON"
          "polygon"
          "Polygon"
          "POLYGON"
      , query
          Project.Primitive.Text
          "text"
          "Text"
          "text"
          "Text"
          "TEXT"
          "text"
          "Text"
          "TEXT"
      , query
          Project.Primitive.Time
          "time"
          "Time"
          "time"
          "Time"
          "TIME"
          "time"
          "Time"
          "TIME"
      , query
          Project.Primitive.Timestamp
          "timestamp"
          "Timestamp"
          "timestamp"
          "Timestamp"
          "TIMESTAMP"
          "timestamp"
          "Timestamp"
          "TIMESTAMP"
      , query
          Project.Primitive.Timestamptz
          "timestamptz"
          "Timestamptz"
          "timestamptz"
          "Timestamptz"
          "TIMESTAMPTZ"
          "timestamptz"
          "Timestamptz"
          "TIMESTAMPTZ"
      , query
          Project.Primitive.Timetz
          "timetz"
          "Timetz"
          "timetz"
          "Timetz"
          "TIMETZ"
          "timetz"
          "Timetz"
          "TIMETZ"
      , query
          Project.Primitive.Tsmultirange
          "tsmultirange"
          "Tsmultirange"
          "tsmultirange"
          "Tsmultirange"
          "TSMULTIRANGE"
          "tsmultirange"
          "Tsmultirange"
          "TSMULTIRANGE"
      , query
          Project.Primitive.Tsquery
          "tsquery"
          "Tsquery"
          "tsquery"
          "Tsquery"
          "TSQUERY"
          "tsquery"
          "Tsquery"
          "TSQUERY"
      , query
          Project.Primitive.Tsrange
          "tsrange"
          "Tsrange"
          "tsrange"
          "Tsrange"
          "TSRANGE"
          "tsrange"
          "Tsrange"
          "TSRANGE"
      , query
          Project.Primitive.Tstzmultirange
          "tstzmultirange"
          "Tstzmultirange"
          "tstzmultirange"
          "Tstzmultirange"
          "TSTZMULTIRANGE"
          "tstzmultirange"
          "Tstzmultirange"
          "TSTZMULTIRANGE"
      , query
          Project.Primitive.Tstzrange
          "tstzrange"
          "Tstzrange"
          "tstzrange"
          "Tstzrange"
          "TSTZRANGE"
          "tstzrange"
          "Tstzrange"
          "TSTZRANGE"
      , query
          Project.Primitive.Tsvector
          "tsvector"
          "Tsvector"
          "tsvector"
          "Tsvector"
          "TSVECTOR"
          "tsvector"
          "Tsvector"
          "TSVECTOR"
      , query
          Project.Primitive.Uuid
          "uuid"
          "Uuid"
          "uuid"
          "Uuid"
          "UUID"
          "uuid"
          "Uuid"
          "UUID"
      , query
          Project.Primitive.Varbit
          "varbit"
          "Varbit"
          "varbit"
          "Varbit"
          "VARBIT"
          "varbit"
          "Varbit"
          "VARBIT"
      , query
          Project.Primitive.Varchar
          "varchar"
          "Varchar"
          "varchar"
          "Varchar"
          "VARCHAR"
          "varchar"
          "Varchar"
          "VARCHAR"
      , query
          Project.Primitive.Xml
          "xml"
          "Xml"
          "xml"
          "Xml"
          "XML"
          "xml"
          "Xml"
          "XML"
      ]
    , migrations =
      [ { name = "1"
        , sql =
            ''
            create extension ltree;
            create extension hstore;
            create extension citext;
            ''
        }
      ]
    }
