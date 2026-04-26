let Project = ../Project.dhall

let CodegenKit = ../CodegenKit.dhall

let Lude = ../Lude.dhall

let Name = CodegenKit.Name

let Char = Lude.Structures.LatinChar.Type

let a = Char.A

let b = Char.B

let c = Char.C

let d = Char.D

let e = Char.E

let f = Char.F

let g = Char.G

let h = Char.H

let i = Char.I

let j = Char.J

let k = Char.K

let l = Char.L

let m = Char.M

let n = Char.N

let o = Char.O

let p = Char.P

let q = Char.Q

let r = Char.R

let s = Char.S

let t = Char.T

let u = Char.U

let v = Char.V

let w = Char.W

let x = Char.X

let y = Char.Y

let z = Char.Z

let LatinChars/fromList =
      \(charList : List Char) ->
        merge
          { None = { head = z, tail = [] : List Char }
          , Some = \(latinChars : Lude.Structures.LatinChars.Type) -> latinChars
          }
          (Lude.Extensions.List.uncons Char charList)

let Name/chars
    : List Char -> Name.Type
    = \(charList : List Char) ->
        Name.fromLatinChars (LatinChars/fromList charList)

let Name/charsAndNumber =
      \(chars : List Char) ->
      \(number : Natural) ->
        Name.fromLatinCharsAndNumber (LatinChars/fromList chars) number

let member =
      \(name : Name.Type) ->
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

let query =
      \(primitive : Project.Primitive) ->
      \(name : Name.Type) ->
        let sqlName = Project.Primitive/toText primitive

        in  { name = Name.concat (Name/chars [ s, e, l, e, c, t ]) [ name ]
            , srcPath = "./queries/select_" ++ sqlName ++ ".sql"
            , idempotent = True
            , params =
              [ member (Name/chars [ p, a, r, a, m ]) "param" primitive ]
            , result = Some
              { cardinality = Project.ResultRowsCardinality.Multiple
              , columns =
                { head = member name sqlName primitive
                , tail = [] : List Project.Member
                }
              }
            , fragments =
              [ Project.QueryFragment.Sql "select "
              , Project.QueryFragment.Var
                  { name = Name/chars [ p, a, r, a, m ]
                  , rawName = "param"
                  , paramIndex = 0
                  }
              , Project.QueryFragment.Sql ("::" ++ sqlName)
              ]
            }

let project =
      { space =
          Name.concat (Name/chars [ m, y ]) [ Name/chars [ s, p, a, c, e ] ]
      , name =
          Name.concat
            (Name/chars [ m, u, s, i, c ])
            [ Name/chars [ c, a, t, a, l, o, g, u, e ] ]
      , version = { major = 1, minor = 0, patch = 1 }
      , customTypes = [] : List Project.CustomType
      , queries =
        [ query Project.Primitive.Bit (Name/chars [ b, i, t ])
        , query Project.Primitive.Bool (Name/chars [ b, o, o, l ])
        , query Project.Primitive.Box (Name/chars [ b, o, x ])
        , query Project.Primitive.Bpchar (Name/chars [ b, p, c, h, a, r ])
        , query Project.Primitive.Bytea (Name/chars [ b, y, t, e, a ])
        , query Project.Primitive.Char (Name/chars [ c, h, a, r ])
        , query Project.Primitive.Cidr (Name/chars [ c, i, d, r ])
        , query Project.Primitive.Circle (Name/chars [ c, i, r, c, l, e ])
        , query Project.Primitive.Citext (Name/chars [ c, i, t, e, x, t ])
        , query Project.Primitive.Date (Name/chars [ d, a, t, e ])
        , query
            Project.Primitive.Datemultirange
            (Name/chars [ d, a, t, e, m, u, l, t, i, r, a, n, g, e ])
        , query
            Project.Primitive.Daterange
            (Name/chars [ d, a, t, e, r, a, n, g, e ])
        , query
            Project.Primitive.Float4
            (Name/charsAndNumber [ f, l, o, a, t ] 4)
        , query
            Project.Primitive.Float8
            (Name/charsAndNumber [ f, l, o, a, t ] 8)
        , query Project.Primitive.Hstore (Name/chars [ h, s, t, o, r, e ])
        , query Project.Primitive.Inet (Name/chars [ i, n, e, t ])
        , query Project.Primitive.Int2 (Name/charsAndNumber [ i, n, t ] 2)
        , query Project.Primitive.Int4 (Name/charsAndNumber [ i, n, t ] 4)
        , query
            Project.Primitive.Int4multirange
            ( Name.concat
                (Name/charsAndNumber [ i, n, t ] 4)
                [ Name/chars [ m, u, l, t, i, r, a, n, g, e ] ]
            )
        , query
            Project.Primitive.Int4range
            ( Name.concat
                (Name/charsAndNumber [ i, n, t ] 4)
                [ Name/chars [ r, a, n, g, e ] ]
            )
        , query Project.Primitive.Int8 (Name/charsAndNumber [ i, n, t ] 8)
        , query
            Project.Primitive.Int8multirange
            ( Name.concat
                (Name/charsAndNumber [ i, n, t ] 8)
                [ Name/chars [ m, u, l, t, i, r, a, n, g, e ] ]
            )
        , query
            Project.Primitive.Int8range
            ( Name.concat
                (Name/charsAndNumber [ i, n, t ] 8)
                [ Name/chars [ r, a, n, g, e ] ]
            )
        , query
            Project.Primitive.Interval
            (Name/chars [ i, n, t, e, r, v, a, l ])
        , query Project.Primitive.Json (Name/chars [ j, s, o, n ])
        , query Project.Primitive.Jsonb (Name/chars [ j, s, o, n, b ])
        , query Project.Primitive.Line (Name/chars [ l, i, n, e ])
        , query Project.Primitive.Lseg (Name/chars [ l, s, e, g ])
        , query Project.Primitive.Ltree (Name/chars [ l, t, r, e, e ])
        , query Project.Primitive.Macaddr (Name/chars [ m, a, c, a, d, d, r ])
        , query
            Project.Primitive.Macaddr8
            (Name/charsAndNumber [ m, a, c, a, d, d, r ] 8)
        , query Project.Primitive.Money (Name/chars [ m, o, n, e, y ])
        , query Project.Primitive.Name (Name/chars [ n, a, m, e ])
        , query Project.Primitive.Numeric (Name/chars [ n, u, m, e, r, i, c ])
        , query
            Project.Primitive.Nummultirange
            (Name/chars [ n, u, m, m, u, l, t, i, r, a, n, g, e ])
        , query
            Project.Primitive.Numrange
            (Name/chars [ n, u, m, r, a, n, g, e ])
        , query Project.Primitive.Oid (Name/chars [ o, i, d ])
        , query Project.Primitive.Path (Name/chars [ p, a, t, h ])
        , query
            Project.Primitive.PgLsn
            (Name.concat (Name/chars [ p, g ]) [ Name/chars [ l, s, n ] ])
        , query
            Project.Primitive.PgSnapshot
            ( Name.concat
                (Name/chars [ p, g ])
                [ Name/chars [ s, n, a, p, s, h, o, t ] ]
            )
        , query Project.Primitive.Point (Name/chars [ p, o, i, n, t ])
        , query Project.Primitive.Polygon (Name/chars [ p, o, l, y, g, o, n ])
        , query Project.Primitive.Text (Name/chars [ t, e, x, t ])
        , query Project.Primitive.Time (Name/chars [ t, i, m, e ])
        , query
            Project.Primitive.Timestamp
            (Name/chars [ t, i, m, e, s, t, a, m, p ])
        , query
            Project.Primitive.Timestamptz
            (Name/chars [ t, i, m, e, s, t, a, m, p, t, z ])
        , query Project.Primitive.Timetz (Name/chars [ t, i, m, e, t, z ])
        , query
            Project.Primitive.Tsmultirange
            (Name/chars [ t, s, m, u, l, t, i, r, a, n, g, e ])
        , query Project.Primitive.Tsquery (Name/chars [ t, s, q, u, e, r, y ])
        , query Project.Primitive.Tsrange (Name/chars [ t, s, r, a, n, g, e ])
        , query
            Project.Primitive.Tstzmultirange
            (Name/chars [ t, s, t, z, m, u, l, t, i, r, a, n, g, e ])
        , query
            Project.Primitive.Tstzrange
            (Name/chars [ t, s, t, z, r, a, n, g, e ])
        , query
            Project.Primitive.Tsvector
            (Name/chars [ t, s, v, e, c, t, o, r ])
        , query Project.Primitive.Uuid (Name/chars [ u, u, i, d ])
        , query Project.Primitive.Varbit (Name/chars [ v, a, r, b, i, t ])
        , query Project.Primitive.Varchar (Name/chars [ v, a, r, c, h, a, r ])
        , query Project.Primitive.Xml (Name/chars [ x, m, l ])
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

in  project
