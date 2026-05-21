let Prelude = ../Deps/Prelude.dhall

let Project = ../Project.dhall

let name =
      \(inCamelCase : Text) ->
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
        : Project.Name

let scalarQueries =
      \(scalar : Project.Scalar) ->
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

        let scalarTypeSig =
              if Text/equal inSnakeCase "char" then "\"char\"" else inSnakeCase

        let query =
              \(nullable : Bool) ->
              \(dimensionality : Natural) ->
              \(elementIsNullable : Bool) ->
                let typeSig =
                          scalarTypeSig
                      ++  Prelude.Text.replicate dimensionality "[]"

                let member =
                      { name = primitiveName
                      , pgName = inSnakeCase
                      , isNullable = nullable
                      , value =
                        { arraySettings =
                            if    Natural/isZero dimensionality
                            then  None Project.ArraySettings
                            else  Some { dimensionality, elementIsNullable }
                        , scalar
                        }
                      }

                let dimensionality = Natural/show dimensionality

                let nullable = if nullable then "1" else "0"

                let elementIsNullable = if elementIsNullable then "1" else "0"

                let name =
                      name
                        "select${inPascalCase}${nullable}${dimensionality}${elementIsNullable}"
                        "Select${inPascalCase}${nullable}${dimensionality}${elementIsNullable}"
                        "select-${inKebabCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "Select-${inTrainCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "SELECT-${inScreamingKebabCase}-${nullable}-${dimensionality}-${elementIsNullable}"
                        "select_${inSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                        "Select_${inCamelSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"
                        "SELECT_${inScreamingSnakeCase}_${nullable}_${dimensionality}_${elementIsNullable}"

                in  { name
                    , srcPath = "./queries/${name.inSnakeCase}.sql"
                    , idempotent = True
                    , params = [ member ]
                    , result = Some
                      { cardinality = Project.ResultRowsCardinality.Multiple
                      , columns =
                        { head = member, tail = [] : List Project.Member }
                      }
                    , fragments =
                      [ Project.QueryFragment.Sql "select "
                      , Project.QueryFragment.Var
                          { name = primitiveName
                          , rawName = inSnakeCase
                          , paramIndex = 0
                          }
                      , Project.QueryFragment.Sql "::${typeSig}"
                      ]
                    }

        in  [ query True 0 False
            , query True 1 False
            , query True 2 False
            , query True 1 True
            , query True 2 True
            , query False 0 False
            , query False 1 False
            , query False 2 False
            , query False 1 True
            , query False 2 True
            ]

let primitiveQueries =
      \(primitive : Project.Primitive) ->
        scalarQueries (Project.Scalar.Primitive primitive)

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
        Prelude.List.concat
          Project.Query
          [ primitiveQueries
              Project.Primitive.Bit
              "bit"
              "Bit"
              "bit"
              "Bit"
              "BIT"
              "bit"
              "Bit"
              "BIT"
          , primitiveQueries
              Project.Primitive.Bool
              "bool"
              "Bool"
              "bool"
              "Bool"
              "BOOL"
              "bool"
              "Bool"
              "BOOL"
          , primitiveQueries
              Project.Primitive.Box
              "box"
              "Box"
              "box"
              "Box"
              "BOX"
              "box"
              "Box"
              "BOX"
          , primitiveQueries
              Project.Primitive.Bpchar
              "bpchar"
              "Bpchar"
              "bpchar"
              "Bpchar"
              "BPCHAR"
              "bpchar"
              "Bpchar"
              "BPCHAR"
          , primitiveQueries
              Project.Primitive.Bytea
              "bytea"
              "Bytea"
              "bytea"
              "Bytea"
              "BYTEA"
              "bytea"
              "Bytea"
              "BYTEA"
          , primitiveQueries
              Project.Primitive.Char
              "char"
              "Char"
              "char"
              "Char"
              "CHAR"
              "char"
              "Char"
              "CHAR"
          , primitiveQueries
              Project.Primitive.Cidr
              "cidr"
              "Cidr"
              "cidr"
              "Cidr"
              "CIDR"
              "cidr"
              "Cidr"
              "CIDR"
          , primitiveQueries
              Project.Primitive.Circle
              "circle"
              "Circle"
              "circle"
              "Circle"
              "CIRCLE"
              "circle"
              "Circle"
              "CIRCLE"
          , primitiveQueries
              Project.Primitive.Citext
              "citext"
              "Citext"
              "citext"
              "Citext"
              "CITEXT"
              "citext"
              "Citext"
              "CITEXT"
          , primitiveQueries
              Project.Primitive.Date
              "date"
              "Date"
              "date"
              "Date"
              "DATE"
              "date"
              "Date"
              "DATE"
          , primitiveQueries
              Project.Primitive.Datemultirange
              "datemultirange"
              "Datemultirange"
              "datemultirange"
              "Datemultirange"
              "DATEMULTIRANGE"
              "datemultirange"
              "Datemultirange"
              "DATEMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Daterange
              "daterange"
              "Daterange"
              "daterange"
              "Daterange"
              "DATERANGE"
              "daterange"
              "Daterange"
              "DATERANGE"
          , primitiveQueries
              Project.Primitive.Float4
              "float4"
              "Float4"
              "float4"
              "Float4"
              "FLOAT4"
              "float4"
              "Float4"
              "FLOAT4"
          , primitiveQueries
              Project.Primitive.Float8
              "float8"
              "Float8"
              "float8"
              "Float8"
              "FLOAT8"
              "float8"
              "Float8"
              "FLOAT8"
          , primitiveQueries
              Project.Primitive.Hstore
              "hstore"
              "Hstore"
              "hstore"
              "Hstore"
              "HSTORE"
              "hstore"
              "Hstore"
              "HSTORE"
          , primitiveQueries
              Project.Primitive.Inet
              "inet"
              "Inet"
              "inet"
              "Inet"
              "INET"
              "inet"
              "Inet"
              "INET"
          , primitiveQueries
              Project.Primitive.Int2
              "int2"
              "Int2"
              "int2"
              "Int2"
              "INT2"
              "int2"
              "Int2"
              "INT2"
          , primitiveQueries
              Project.Primitive.Int4
              "int4"
              "Int4"
              "int4"
              "Int4"
              "INT4"
              "int4"
              "Int4"
              "INT4"
          , primitiveQueries
              Project.Primitive.Int4multirange
              "int4multirange"
              "Int4multirange"
              "int4multirange"
              "Int4multirange"
              "INT4MULTIRANGE"
              "int4multirange"
              "Int4multirange"
              "INT4MULTIRANGE"
          , primitiveQueries
              Project.Primitive.Int4range
              "int4range"
              "Int4range"
              "int4range"
              "Int4range"
              "INT4RANGE"
              "int4range"
              "Int4range"
              "INT4RANGE"
          , primitiveQueries
              Project.Primitive.Int8
              "int8"
              "Int8"
              "int8"
              "Int8"
              "INT8"
              "int8"
              "Int8"
              "INT8"
          , primitiveQueries
              Project.Primitive.Int8multirange
              "int8multirange"
              "Int8multirange"
              "int8multirange"
              "Int8multirange"
              "INT8MULTIRANGE"
              "int8multirange"
              "Int8multirange"
              "INT8MULTIRANGE"
          , primitiveQueries
              Project.Primitive.Int8range
              "int8range"
              "Int8range"
              "int8range"
              "Int8range"
              "INT8RANGE"
              "int8range"
              "Int8range"
              "INT8RANGE"
          , primitiveQueries
              Project.Primitive.Interval
              "interval"
              "Interval"
              "interval"
              "Interval"
              "INTERVAL"
              "interval"
              "Interval"
              "INTERVAL"
          , primitiveQueries
              Project.Primitive.Json
              "json"
              "Json"
              "json"
              "Json"
              "JSON"
              "json"
              "Json"
              "JSON"
          , primitiveQueries
              Project.Primitive.Jsonb
              "jsonb"
              "Jsonb"
              "jsonb"
              "Jsonb"
              "JSONB"
              "jsonb"
              "Jsonb"
              "JSONB"
          , primitiveQueries
              Project.Primitive.Line
              "line"
              "Line"
              "line"
              "Line"
              "LINE"
              "line"
              "Line"
              "LINE"
          , primitiveQueries
              Project.Primitive.Lseg
              "lseg"
              "Lseg"
              "lseg"
              "Lseg"
              "LSEG"
              "lseg"
              "Lseg"
              "LSEG"
          , primitiveQueries
              Project.Primitive.Ltree
              "ltree"
              "Ltree"
              "ltree"
              "Ltree"
              "LTREE"
              "ltree"
              "Ltree"
              "LTREE"
          , primitiveQueries
              Project.Primitive.Macaddr
              "macaddr"
              "Macaddr"
              "macaddr"
              "Macaddr"
              "MACADDR"
              "macaddr"
              "Macaddr"
              "MACADDR"
          , primitiveQueries
              Project.Primitive.Macaddr8
              "macaddr8"
              "Macaddr8"
              "macaddr8"
              "Macaddr8"
              "MACADDR8"
              "macaddr8"
              "Macaddr8"
              "MACADDR8"
          , primitiveQueries
              Project.Primitive.Money
              "money"
              "Money"
              "money"
              "Money"
              "MONEY"
              "money"
              "Money"
              "MONEY"
          , primitiveQueries
              Project.Primitive.Name
              "name"
              "Name"
              "name"
              "Name"
              "NAME"
              "name"
              "Name"
              "NAME"
          , primitiveQueries
              Project.Primitive.Numeric
              "numeric"
              "Numeric"
              "numeric"
              "Numeric"
              "NUMERIC"
              "numeric"
              "Numeric"
              "NUMERIC"
          , primitiveQueries
              Project.Primitive.Nummultirange
              "nummultirange"
              "Nummultirange"
              "nummultirange"
              "Nummultirange"
              "NUMMULTIRANGE"
              "nummultirange"
              "Nummultirange"
              "NUMMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Numrange
              "numrange"
              "Numrange"
              "numrange"
              "Numrange"
              "NUMRANGE"
              "numrange"
              "Numrange"
              "NUMRANGE"
          , primitiveQueries
              Project.Primitive.Oid
              "oid"
              "Oid"
              "oid"
              "Oid"
              "OID"
              "oid"
              "Oid"
              "OID"
          , primitiveQueries
              Project.Primitive.Path
              "path"
              "Path"
              "path"
              "Path"
              "PATH"
              "path"
              "Path"
              "PATH"
          , primitiveQueries
              Project.Primitive.PgLsn
              "pgLsn"
              "PgLsn"
              "pg-lsn"
              "Pg-Lsn"
              "PG-LSN"
              "pg_lsn"
              "Pg_Lsn"
              "PG_LSN"
          , primitiveQueries
              Project.Primitive.PgSnapshot
              "pgSnapshot"
              "PgSnapshot"
              "pg-snapshot"
              "Pg-Snapshot"
              "PG-SNAPSHOT"
              "pg_snapshot"
              "Pg_Snapshot"
              "PG_SNAPSHOT"
          , primitiveQueries
              Project.Primitive.Point
              "point"
              "Point"
              "point"
              "Point"
              "POINT"
              "point"
              "Point"
              "POINT"
          , primitiveQueries
              Project.Primitive.Polygon
              "polygon"
              "Polygon"
              "polygon"
              "Polygon"
              "POLYGON"
              "polygon"
              "Polygon"
              "POLYGON"
          , primitiveQueries
              Project.Primitive.Text
              "text"
              "Text"
              "text"
              "Text"
              "TEXT"
              "text"
              "Text"
              "TEXT"
          , primitiveQueries
              Project.Primitive.Time
              "time"
              "Time"
              "time"
              "Time"
              "TIME"
              "time"
              "Time"
              "TIME"
          , primitiveQueries
              Project.Primitive.Timestamp
              "timestamp"
              "Timestamp"
              "timestamp"
              "Timestamp"
              "TIMESTAMP"
              "timestamp"
              "Timestamp"
              "TIMESTAMP"
          , primitiveQueries
              Project.Primitive.Timestamptz
              "timestamptz"
              "Timestamptz"
              "timestamptz"
              "Timestamptz"
              "TIMESTAMPTZ"
              "timestamptz"
              "Timestamptz"
              "TIMESTAMPTZ"
          , primitiveQueries
              Project.Primitive.Timetz
              "timetz"
              "Timetz"
              "timetz"
              "Timetz"
              "TIMETZ"
              "timetz"
              "Timetz"
              "TIMETZ"
          , primitiveQueries
              Project.Primitive.Tsmultirange
              "tsmultirange"
              "Tsmultirange"
              "tsmultirange"
              "Tsmultirange"
              "TSMULTIRANGE"
              "tsmultirange"
              "Tsmultirange"
              "TSMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Tsquery
              "tsquery"
              "Tsquery"
              "tsquery"
              "Tsquery"
              "TSQUERY"
              "tsquery"
              "Tsquery"
              "TSQUERY"
          , primitiveQueries
              Project.Primitive.Tsrange
              "tsrange"
              "Tsrange"
              "tsrange"
              "Tsrange"
              "TSRANGE"
              "tsrange"
              "Tsrange"
              "TSRANGE"
          , primitiveQueries
              Project.Primitive.Tstzmultirange
              "tstzmultirange"
              "Tstzmultirange"
              "tstzmultirange"
              "Tstzmultirange"
              "TSTZMULTIRANGE"
              "tstzmultirange"
              "Tstzmultirange"
              "TSTZMULTIRANGE"
          , primitiveQueries
              Project.Primitive.Tstzrange
              "tstzrange"
              "Tstzrange"
              "tstzrange"
              "Tstzrange"
              "TSTZRANGE"
              "tstzrange"
              "Tstzrange"
              "TSTZRANGE"
          , primitiveQueries
              Project.Primitive.Tsvector
              "tsvector"
              "Tsvector"
              "tsvector"
              "Tsvector"
              "TSVECTOR"
              "tsvector"
              "Tsvector"
              "TSVECTOR"
          , primitiveQueries
              Project.Primitive.Uuid
              "uuid"
              "Uuid"
              "uuid"
              "Uuid"
              "UUID"
              "uuid"
              "Uuid"
              "UUID"
          , primitiveQueries
              Project.Primitive.Varbit
              "varbit"
              "Varbit"
              "varbit"
              "Varbit"
              "VARBIT"
              "varbit"
              "Varbit"
              "VARBIT"
          , primitiveQueries
              Project.Primitive.Varchar
              "varchar"
              "Varchar"
              "varchar"
              "Varchar"
              "VARCHAR"
              "varchar"
              "Varchar"
              "VARCHAR"
          , primitiveQueries
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
