let _163 =
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
      | Box2D
      | Box3D
      | Ltree
      | Geometry
      | Geography
      >

let _162 =
      < A
      | B
      | C
      | D
      | E
      | F
      | G
      | H
      | I
      | J
      | K
      | L
      | M
      | N
      | O
      | P
      | Q
      | R
      | S
      | T
      | U
      | V
      | W
      | X
      | Y
      | Z
      >

let _161 = < Optional | Single | Multiple >.Multiple

let _160 = _162.Z

let _159 = _162.Y

let _158 = _162.X

let _157 = _162.V

let _156 = _162.U

let _155 = _162.T

let _154 = _162.S

let _153 = _162.R

let _152 = _162.P

let _151 = _162.O

let _150 = _162.N

let _149 = _162.M

let _148 = _162.L

let _147 = _162.J

let _146 = _162.I

let _145 = _162.H

let _144 = _162.G

let _143 = _162.E

let _142 = _162.D

let _141 = _162.C

let _140 = _162.B

let _139 = _162.A

let _138 = { dimensionality : Natural, elementIsNullable : Bool }

let _137 = { head : _162, tail : List _162 }

let _136 = None _138

let _135 = { head = _152, tail = [ _144 ] }

let _134 = < Word : _137 | Number : Natural >

let _133 = _134.Word

let _132 = _134.Number

let _131 = { head = _158, tail = [ _149, _148 ] }

let _130 = { head = _151, tail = [ _146, _142 ] }

let _129 = { head = _146, tail = [ _150, _155 ] }

let _128 = { head = _140, tail = [ _151, _158 ] }

let _127 = { head = _140, tail = [ _146, _155 ] }

let _126 = List _134

let _125 = { head = _156, tail = [ _156, _146, _142 ] }

let _124 = { head = _155, tail = [ _146, _149, _143 ] }

let _123 = { head = _155, tail = [ _143, _158, _155 ] }

let _122 = { head = _152, tail = [ _139, _155, _145 ] }

let _121 = { head = _150, tail = [ _139, _149, _143 ] }

let _120 = { head = _148, tail = [ _154, _143, _144 ] }

let _119 = { head = _148, tail = [ _146, _150, _143 ] }

let _118 = { head = _147, tail = [ _154, _151, _150 ] }

let _117 = { head = _146, tail = [ _150, _143, _155 ] }

let _116 = { head = _142, tail = [ _139, _155, _143 ] }

let _115 = { head = _141, tail = [ _146, _142, _153 ] }

let _114 = { head = _140, tail = [ _151, _151, _148 ] }

let _113 = [] : _126

let _112 = _132 8

let _111 = _132 4

let _110 = _132 2

let _109 = [ _112 ]

let _108 = [ _111 ]

let _107 = { head = _152, tail = [ _151, _146, _150, _155 ] }

let _106 = { head = _149, tail = [ _151, _150, _143, _159 ] }

let _105 = { head = _148, tail = [ _155, _153, _143, _143 ] }

let _104 = { head = _147, tail = [ _154, _151, _150, _140 ] }

let _103 = { head = _162.F, tail = [ _148, _151, _139, _155 ] }

let _102 = { head = _140, tail = [ _159, _155, _143, _139 ] }

let _101 = { head = _157, tail = [ _139, _153, _140, _146, _155 ] }

let _100 = { head = _155, tail = [ _146, _149, _143, _155, _160 ] }

let _99 = { head = _154, tail = [ _143, _148, _143, _141, _155 ] }

let _98 = { head = _145, tail = [ _154, _155, _151, _153, _143 ] }

let _97 = { head = _141, tail = [ _146, _155, _143, _158, _155 ] }

let _96 = { head = _141, tail = [ _146, _153, _141, _148, _143 ] }

let _95 = { head = _140, tail = [ _152, _141, _145, _139, _153 ] }

let _94 = { head : _137, tail : _126 }

let _93 = _133 _135

let _92 = { head = _157, tail = [ _139, _153, _141, _145, _139, _153 ] }

let _91 = { head = _155, tail = [ _154, _153, _139, _150, _144, _143 ] }

let _90 = { head = _155, tail = [ _154, _162.Q, _156, _143, _153, _159 ] }

let _89 = { head = _152, tail = [ _151, _148, _159, _144, _151, _150 ] }

let _88 = { head = _150, tail = [ _156, _149, _143, _153, _146, _141 ] }

let _87 = { head = _149, tail = [ _139, _141, _139, _142, _142, _153 ] }

let _86 = < Primitive : _163 | Custom : _94 >

let _85 = _133 { head = _148, tail = [ _154, _150 ] }

let _84 = _133 _129

let _83 = _86.Primitive

let _82 = { head = _155, tail = [ _154, _157, _143, _141, _155, _151, _153 ] }

let _81 = { head = _150, tail = [ _156, _149, _153, _139, _150, _144, _143 ] }

let _80 = { head = _146, tail = [ _150, _155, _143, _153, _157, _139, _148 ] }

let _79 =
      < Sql : Text
      | Var : { name : _94, rawName : Text, paramIndex : Natural }
      >

let _78 =
      { head = _155, tail = [ _154, _155, _160, _153, _139, _150, _144, _143 ] }

let _77 =
      { head = _155, tail = [ _146, _149, _143, _154, _155, _139, _149, _152 ] }

let _76 =
      { head = _142, tail = [ _139, _155, _143, _153, _139, _150, _144, _143 ] }

let _75 = _79.Sql

let _74 = _133 { head = _153, tail = [ _139, _150, _144, _143 ] }

let _73 = _133 _103

let _72 =
      { head = { head = _152, tail = [ _139, _153, _139, _149 ] }, tail = _113 }

let _71 = { arraySettings : Optional _138, scalar : _86 }

let _70 = _75 "select "

let _69 =
      { head = _155
      , tail = [ _146, _149, _143, _154, _155, _139, _149, _152, _155, _160 ]
      }

let _68 = _133 _87

let _67 =
      { head = _155
      , tail =
        [ _154, _149, _156, _148, _155, _146, _153, _139, _150, _144, _143 ]
      }

let _66 = { arraySettings = _136, scalar = _83 _163.Xml }

let _65 = { arraySettings = _136, scalar = _83 _163.Varchar }

let _64 = { arraySettings = _136, scalar = _83 _163.Varbit }

let _63 = { arraySettings = _136, scalar = _83 _163.Uuid }

let _62 = { arraySettings = _136, scalar = _83 _163.Tsvector }

let _61 = { arraySettings = _136, scalar = _83 _163.Tstzrange }

let _60 = { arraySettings = _136, scalar = _83 _163.Tstzmultirange }

let _59 = { arraySettings = _136, scalar = _83 _163.Tsrange }

let _58 = { arraySettings = _136, scalar = _83 _163.Tsquery }

let _57 = { arraySettings = _136, scalar = _83 _163.Tsmultirange }

let _56 = { arraySettings = _136, scalar = _83 _163.Timetz }

let _55 = { arraySettings = _136, scalar = _83 _163.Timestamptz }

let _54 = { arraySettings = _136, scalar = _83 _163.Timestamp }

let _53 = { arraySettings = _136, scalar = _83 _163.Time }

let _52 = { arraySettings = _136, scalar = _83 _163.Text }

let _51 = { arraySettings = _136, scalar = _83 _163.Polygon }

let _50 = { arraySettings = _136, scalar = _83 _163.Point }

let _49 = { arraySettings = _136, scalar = _83 _163.PgSnapshot }

let _48 = { arraySettings = _136, scalar = _83 _163.PgLsn }

let _47 = { arraySettings = _136, scalar = _83 _163.Path }

let _46 = { arraySettings = _136, scalar = _83 _163.Oid }

let _45 = { arraySettings = _136, scalar = _83 _163.Numrange }

let _44 = { arraySettings = _136, scalar = _83 _163.Nummultirange }

let _43 = { arraySettings = _136, scalar = _83 _163.Numeric }

let _42 = { arraySettings = _136, scalar = _83 _163.Name }

let _41 = { arraySettings = _136, scalar = _83 _163.Money }

let _40 = { arraySettings = _136, scalar = _83 _163.Macaddr8 }

let _39 = { arraySettings = _136, scalar = _83 _163.Macaddr }

let _38 = { arraySettings = _136, scalar = _83 _163.Ltree }

let _37 = { arraySettings = _136, scalar = _83 _163.Lseg }

let _36 = { arraySettings = _136, scalar = _83 _163.Line }

let _35 = { arraySettings = _136, scalar = _83 _163.Jsonb }

let _34 = { arraySettings = _136, scalar = _83 _163.Json }

let _33 = { arraySettings = _136, scalar = _83 _163.Interval }

let _32 = { arraySettings = _136, scalar = _83 _163.Int8range }

let _31 = { arraySettings = _136, scalar = _83 _163.Int8multirange }

let _30 = { arraySettings = _136, scalar = _83 _163.Int8 }

let _29 = { arraySettings = _136, scalar = _83 _163.Int4range }

let _28 = { arraySettings = _136, scalar = _83 _163.Int4multirange }

let _27 = { arraySettings = _136, scalar = _83 _163.Int4 }

let _26 = { arraySettings = _136, scalar = _83 _163.Int2 }

let _25 = { arraySettings = _136, scalar = _83 _163.Inet }

let _24 = { arraySettings = _136, scalar = _83 _163.Hstore }

let _23 = { arraySettings = _136, scalar = _83 _163.Float8 }

let _22 = { arraySettings = _136, scalar = _83 _163.Float4 }

let _21 = { arraySettings = _136, scalar = _83 _163.Daterange }

let _20 = { arraySettings = _136, scalar = _83 _163.Datemultirange }

let _19 = { arraySettings = _136, scalar = _83 _163.Date }

let _18 = { arraySettings = _136, scalar = _83 _163.Citext }

let _17 = { arraySettings = _136, scalar = _83 _163.Circle }

let _16 = { arraySettings = _136, scalar = _83 _163.Cidr }

let _15 = { arraySettings = _136, scalar = _83 _163.Bytea }

let _14 = { arraySettings = _136, scalar = _83 _163.Bpchar }

let _13 = { arraySettings = _136, scalar = _83 _163.Box }

let _12 = { arraySettings = _136, scalar = _83 _163.Bool }

let _11 = { arraySettings = _136, scalar = _83 _163.Bit }

let _10 =
      _133 { head = _154, tail = [ _150, _139, _152, _154, _145, _151, _155 ] }

let _9 =
      { head = _150
      , tail =
        [ _156
        , _149
        , _149
        , _156
        , _148
        , _155
        , _146
        , _153
        , _139
        , _150
        , _144
        , _143
        ]
      }

let _8 =
      { head = _155
      , tail =
        [ _154
        , _155
        , _160
        , _149
        , _156
        , _148
        , _155
        , _146
        , _153
        , _139
        , _150
        , _144
        , _143
        ]
      }

let _7 =
      { head = _142
      , tail =
        [ _139
        , _155
        , _143
        , _149
        , _156
        , _148
        , _155
        , _146
        , _153
        , _139
        , _150
        , _144
        , _143
        ]
      }

let _6 =
      _133
        { head = _149
        , tail = [ _156, _148, _155, _146, _153, _139, _150, _144, _143 ]
        }

let _5 = List { name : _94, pgName : Text, isNullable : Bool, value : _71 }

let _4 = [] : _5

let _3 = _79.Var { name = _72, rawName = "param", paramIndex = 0 }

let _2 = [ { name = _72, pgName = "param", isNullable = True, value = _14 } ]

let _1 =
      Some
        { cardinality = _161
        , columns =
          { head =
            { name = { head = _95, tail = _113 }
            , pgName = "bpchar"
            , isNullable = True
            , value = _14
            }
          , tail = _4
          }
        }

in  { space =
      { head = { head = _149, tail = [ _159 ] }
      , tail = [ _133 { head = _154, tail = [ _152, _139, _141, _143 ] } ]
      }
    , name =
      { head = { head = _149, tail = [ _156, _154, _146, _141 ] }
      , tail =
        [ _133
            { head = _141
            , tail = [ _139, _155, _139, _148, _151, _144, _156, _143 ]
            }
        ]
      }
    , version = { major = 1, minor = 0, patch = 1 }
    , customTypes =
        [] : List
               { name : _94
               , pgSchema : Text
               , pgName : Text
               , definition :
                   < Composite : _5
                   | Enum : List { name : _94, pgName : Text }
                   | Domain : _71
                   >
               }
    , queries =
      [ { name = { head = _99, tail = [ _133 _127 ] }
        , srcPath = "./queries/select_bit.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _11 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _127, tail = _113 }
              , pgName = "bit"
              , isNullable = True
              , value = _11
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::bit" ]
        }
      , { name = { head = _99, tail = [ _133 _114 ] }
        , srcPath = "./queries/select_bool.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _12 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _114, tail = _113 }
              , pgName = "bool"
              , isNullable = True
              , value = _12
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::bool" ]
        }
      , { name = { head = _99, tail = [ _133 _128 ] }
        , srcPath = "./queries/select_box.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _13 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _128, tail = _113 }
              , pgName = "box"
              , isNullable = True
              , value = _13
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::box" ]
        }
      , { name = { head = _99, tail = [ _133 _95 ] }
        , srcPath = "./queries/select_bpchar.sql"
        , idempotent = False
        , params = _2
        , result = _1
        , fragments = [ _70, _3, _75 "::bpchar" ]
        }
      , { name = { head = _99, tail = [ _133 _102 ] }
        , srcPath = "./queries/select_bytea.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _15 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _102, tail = _113 }
              , pgName = "bytea"
              , isNullable = True
              , value = _15
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::bytea" ]
        }
      , { name =
          { head = _99
          , tail = [ _133 { head = _141, tail = [ _145, _139, _153 ] } ]
          }
        , srcPath = "./queries/select_char.sql"
        , idempotent = False
        , params = _2
        , result = _1
        , fragments = [ _70, _3, _75 "::char" ]
        }
      , { name = { head = _99, tail = [ _133 _115 ] }
        , srcPath = "./queries/select_cidr.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _16 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _115, tail = _113 }
              , pgName = "cidr"
              , isNullable = True
              , value = _16
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::cidr" ]
        }
      , { name = { head = _99, tail = [ _133 _96 ] }
        , srcPath = "./queries/select_circle.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _17 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _96, tail = _113 }
              , pgName = "circle"
              , isNullable = True
              , value = _17
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::circle" ]
        }
      , { name = { head = _99, tail = [ _133 _97 ] }
        , srcPath = "./queries/select_citext.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _18 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _97, tail = _113 }
              , pgName = "citext"
              , isNullable = True
              , value = _18
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::citext" ]
        }
      , { name = { head = _99, tail = [ _133 _116 ] }
        , srcPath = "./queries/select_date.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _19 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _116, tail = _113 }
              , pgName = "date"
              , isNullable = True
              , value = _19
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::date" ]
        }
      , { name = { head = _99, tail = [ _133 _7 ] }
        , srcPath = "./queries/select_datemultirange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _20 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _7, tail = _113 }
              , pgName = "datemultirange"
              , isNullable = True
              , value = _20
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::datemultirange" ]
        }
      , { name = { head = _99, tail = [ _133 _76 ] }
        , srcPath = "./queries/select_daterange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _21 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _76, tail = _113 }
              , pgName = "daterange"
              , isNullable = True
              , value = _21
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::daterange" ]
        }
      , { name = { head = _99, tail = [ _73, _111 ] }
        , srcPath = "./queries/select_float4.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _22 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _103, tail = _108 }
              , pgName = "float4"
              , isNullable = True
              , value = _22
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::float4" ]
        }
      , { name = { head = _99, tail = [ _73, _112 ] }
        , srcPath = "./queries/select_float8.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _23 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _103, tail = _109 }
              , pgName = "float8"
              , isNullable = True
              , value = _23
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::float8" ]
        }
      , { name = { head = _99, tail = [ _133 _98 ] }
        , srcPath = "./queries/select_hstore.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _24 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _98, tail = _113 }
              , pgName = "hstore"
              , isNullable = True
              , value = _24
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::hstore" ]
        }
      , { name = { head = _99, tail = [ _133 _117 ] }
        , srcPath = "./queries/select_inet.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _25 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _117, tail = _113 }
              , pgName = "inet"
              , isNullable = True
              , value = _25
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::inet" ]
        }
      , { name = { head = _99, tail = [ _84, _110 ] }
        , srcPath = "./queries/select_int2.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _26 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = [ _110 ] }
              , pgName = "int2"
              , isNullable = True
              , value = _26
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int2" ]
        }
      , { name = { head = _99, tail = [ _84, _111 ] }
        , srcPath = "./queries/select_int4.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _27 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = _108 }
              , pgName = "int4"
              , isNullable = True
              , value = _27
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int4" ]
        }
      , { name = { head = _99, tail = [ _84, _111, _6 ] }
        , srcPath = "./queries/select_int4multirange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _28 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = [ _111, _6 ] }
              , pgName = "int4multirange"
              , isNullable = True
              , value = _28
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int4multirange" ]
        }
      , { name = { head = _99, tail = [ _84, _111, _74 ] }
        , srcPath = "./queries/select_int4range.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _29 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = [ _111, _74 ] }
              , pgName = "int4range"
              , isNullable = True
              , value = _29
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int4range" ]
        }
      , { name = { head = _99, tail = [ _84, _112 ] }
        , srcPath = "./queries/select_int8.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _30 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = _109 }
              , pgName = "int8"
              , isNullable = True
              , value = _30
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int8" ]
        }
      , { name = { head = _99, tail = [ _84, _112, _6 ] }
        , srcPath = "./queries/select_int8multirange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _31 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = [ _112, _6 ] }
              , pgName = "int8multirange"
              , isNullable = True
              , value = _31
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int8multirange" ]
        }
      , { name = { head = _99, tail = [ _84, _112, _74 ] }
        , srcPath = "./queries/select_int8range.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _32 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _129, tail = [ _112, _74 ] }
              , pgName = "int8range"
              , isNullable = True
              , value = _32
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::int8range" ]
        }
      , { name = { head = _99, tail = [ _133 _80 ] }
        , srcPath = "./queries/select_interval.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _33 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _80, tail = _113 }
              , pgName = "interval"
              , isNullable = True
              , value = _33
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::interval" ]
        }
      , { name = { head = _99, tail = [ _133 _118 ] }
        , srcPath = "./queries/select_json.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _34 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _118, tail = _113 }
              , pgName = "json"
              , isNullable = True
              , value = _34
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::json" ]
        }
      , { name = { head = _99, tail = [ _133 _104 ] }
        , srcPath = "./queries/select_jsonb.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _35 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _104, tail = _113 }
              , pgName = "jsonb"
              , isNullable = True
              , value = _35
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::jsonb" ]
        }
      , { name = { head = _99, tail = [ _133 _119 ] }
        , srcPath = "./queries/select_line.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _36 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _119, tail = _113 }
              , pgName = "line"
              , isNullable = True
              , value = _36
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::line" ]
        }
      , { name = { head = _99, tail = [ _133 _120 ] }
        , srcPath = "./queries/select_lseg.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _37 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _120, tail = _113 }
              , pgName = "lseg"
              , isNullable = True
              , value = _37
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::lseg" ]
        }
      , { name = { head = _99, tail = [ _133 _105 ] }
        , srcPath = "./queries/select_ltree.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _38 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _105, tail = _113 }
              , pgName = "ltree"
              , isNullable = True
              , value = _38
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::ltree" ]
        }
      , { name = { head = _99, tail = [ _68 ] }
        , srcPath = "./queries/select_macaddr.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _39 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _87, tail = _113 }
              , pgName = "macaddr"
              , isNullable = True
              , value = _39
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::macaddr" ]
        }
      , { name = { head = _99, tail = [ _68, _112 ] }
        , srcPath = "./queries/select_macaddr8.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _40 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _87, tail = _109 }
              , pgName = "macaddr8"
              , isNullable = True
              , value = _40
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::macaddr8" ]
        }
      , { name = { head = _99, tail = [ _133 _106 ] }
        , srcPath = "./queries/select_money.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _41 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _106, tail = _113 }
              , pgName = "money"
              , isNullable = True
              , value = _41
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::money" ]
        }
      , { name = { head = _99, tail = [ _133 _121 ] }
        , srcPath = "./queries/select_name.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _42 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _121, tail = _113 }
              , pgName = "name"
              , isNullable = True
              , value = _42
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::name" ]
        }
      , { name = { head = _99, tail = [ _133 _88 ] }
        , srcPath = "./queries/select_numeric.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _43 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _88, tail = _113 }
              , pgName = "numeric"
              , isNullable = True
              , value = _43
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::numeric" ]
        }
      , { name = { head = _99, tail = [ _133 _9 ] }
        , srcPath = "./queries/select_nummultirange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _44 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _9, tail = _113 }
              , pgName = "nummultirange"
              , isNullable = True
              , value = _44
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::nummultirange" ]
        }
      , { name = { head = _99, tail = [ _133 _81 ] }
        , srcPath = "./queries/select_numrange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _45 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _81, tail = _113 }
              , pgName = "numrange"
              , isNullable = True
              , value = _45
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::numrange" ]
        }
      , { name = { head = _99, tail = [ _133 _130 ] }
        , srcPath = "./queries/select_oid.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _46 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _130, tail = _113 }
              , pgName = "oid"
              , isNullable = True
              , value = _46
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::oid" ]
        }
      , { name = { head = _99, tail = [ _133 _122 ] }
        , srcPath = "./queries/select_path.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _47 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _122, tail = _113 }
              , pgName = "path"
              , isNullable = True
              , value = _47
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::path" ]
        }
      , { name = { head = _99, tail = [ _93, _85 ] }
        , srcPath = "./queries/select_pg_lsn.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _48 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _135, tail = [ _85 ] }
              , pgName = "pg_lsn"
              , isNullable = True
              , value = _48
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::pg_lsn" ]
        }
      , { name = { head = _99, tail = [ _93, _10 ] }
        , srcPath = "./queries/select_pg_snapshot.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _49 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _135, tail = [ _10 ] }
              , pgName = "pg_snapshot"
              , isNullable = True
              , value = _49
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::pg_snapshot" ]
        }
      , { name = { head = _99, tail = [ _133 _107 ] }
        , srcPath = "./queries/select_point.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _50 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _107, tail = _113 }
              , pgName = "point"
              , isNullable = True
              , value = _50
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::point" ]
        }
      , { name = { head = _99, tail = [ _133 _89 ] }
        , srcPath = "./queries/select_polygon.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _51 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _89, tail = _113 }
              , pgName = "polygon"
              , isNullable = True
              , value = _51
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::polygon" ]
        }
      , { name = { head = _99, tail = [ _133 _123 ] }
        , srcPath = "./queries/select_text.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _52 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _123, tail = _113 }
              , pgName = "text"
              , isNullable = True
              , value = _52
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::text" ]
        }
      , { name = { head = _99, tail = [ _133 _124 ] }
        , srcPath = "./queries/select_time.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _53 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _124, tail = _113 }
              , pgName = "time"
              , isNullable = True
              , value = _53
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::time" ]
        }
      , { name = { head = _99, tail = [ _133 _77 ] }
        , srcPath = "./queries/select_timestamp.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _54 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _77, tail = _113 }
              , pgName = "timestamp"
              , isNullable = True
              , value = _54
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::timestamp" ]
        }
      , { name = { head = _99, tail = [ _133 _69 ] }
        , srcPath = "./queries/select_timestamptz.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _55 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _69, tail = _113 }
              , pgName = "timestamptz"
              , isNullable = True
              , value = _55
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::timestamptz" ]
        }
      , { name = { head = _99, tail = [ _133 _100 ] }
        , srcPath = "./queries/select_timetz.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _56 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _100, tail = _113 }
              , pgName = "timetz"
              , isNullable = True
              , value = _56
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::timetz" ]
        }
      , { name = { head = _99, tail = [ _133 _67 ] }
        , srcPath = "./queries/select_tsmultirange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _57 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _67, tail = _113 }
              , pgName = "tsmultirange"
              , isNullable = True
              , value = _57
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::tsmultirange" ]
        }
      , { name = { head = _99, tail = [ _133 _90 ] }
        , srcPath = "./queries/select_tsquery.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _58 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _90, tail = _113 }
              , pgName = "tsquery"
              , isNullable = True
              , value = _58
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::tsquery" ]
        }
      , { name = { head = _99, tail = [ _133 _91 ] }
        , srcPath = "./queries/select_tsrange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _59 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _91, tail = _113 }
              , pgName = "tsrange"
              , isNullable = True
              , value = _59
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::tsrange" ]
        }
      , { name = { head = _99, tail = [ _133 _8 ] }
        , srcPath = "./queries/select_tstzmultirange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _60 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _8, tail = _113 }
              , pgName = "tstzmultirange"
              , isNullable = True
              , value = _60
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::tstzmultirange" ]
        }
      , { name = { head = _99, tail = [ _133 _78 ] }
        , srcPath = "./queries/select_tstzrange.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _61 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _78, tail = _113 }
              , pgName = "tstzrange"
              , isNullable = True
              , value = _61
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::tstzrange" ]
        }
      , { name = { head = _99, tail = [ _133 _82 ] }
        , srcPath = "./queries/select_tsvector.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _62 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _82, tail = _113 }
              , pgName = "tsvector"
              , isNullable = True
              , value = _62
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::tsvector" ]
        }
      , { name = { head = _99, tail = [ _133 _125 ] }
        , srcPath = "./queries/select_uuid.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _63 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _125, tail = _113 }
              , pgName = "uuid"
              , isNullable = True
              , value = _63
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::uuid" ]
        }
      , { name = { head = _99, tail = [ _133 _101 ] }
        , srcPath = "./queries/select_varbit.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _64 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _101, tail = _113 }
              , pgName = "varbit"
              , isNullable = True
              , value = _64
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::varbit" ]
        }
      , { name = { head = _99, tail = [ _133 _92 ] }
        , srcPath = "./queries/select_varchar.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _65 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _92, tail = _113 }
              , pgName = "varchar"
              , isNullable = True
              , value = _65
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::varchar" ]
        }
      , { name = { head = _99, tail = [ _133 _131 ] }
        , srcPath = "./queries/select_xml.sql"
        , idempotent = False
        , params =
          [ { name = _72, pgName = "param", isNullable = True, value = _66 } ]
        , result = Some
          { cardinality = _161
          , columns =
            { head =
              { name = { head = _131, tail = _113 }
              , pgName = "xml"
              , isNullable = True
              , value = _66
              }
            , tail = _4
            }
          }
        , fragments = [ _70, _3, _75 "::xml" ]
        }
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
