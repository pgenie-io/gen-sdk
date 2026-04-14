let _138 = < Optional | Single | Multiple >

let _137 =
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

let _136 =
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

let _135 = _138.Multiple

let _134 = _136.Y

let _133 = _136.V

let _132 = _136.U

let _131 = _136.T

let _130 = _136.S

let _129 = _136.R

let _128 = _136.P

let _127 = _136.O

let _126 = _136.N

let _125 = _136.M

let _124 = _136.L

let _123 = _136.K

let _122 = _136.I

let _121 = _136.H

let _120 = _136.G

let _119 = _136.F

let _118 = _136.E

let _117 = _136.D

let _116 = _136.C

let _115 = _136.B

let _114 = _136.A

let _113 = { dimensionality : Natural, elementIsNullable : Bool }

let _112 = [ _134 ]

let _111 = [ _117 ]

let _110 = Some { dimensionality = 1, elementIsNullable = True }

let _109 = Some { dimensionality = 1, elementIsNullable = False }

let _108 = { head : _136, tail : List _136 }

let _107 = None _113

let _106 = { head = _122, tail = _111 }

let _105 = < Word : _108 | Number : Natural >

let _104 = _105.Word

let _103 = List _105

let _102 = { head = _128, tail = [ _114, _131, _121 ] }

let _101 = { head = _126, tail = [ _114, _125, _118 ] }

let _100 = { head = _117, tail = [ _122, _130, _116 ] }

let _99 = [] : _103

let _98 = { head = _127, tail = [ _129, _117, _118, _129 ] }

let _97 = { head = _120, tail = [ _118, _126, _129, _118 ] }

let _96 = { head = _114, tail = [ _124, _115, _132, _125 ] }

let _95 = { head = _132, tail = [ _128, _117, _114, _131, _118 ] }

let _94 = { head = _131, tail = [ _129, _114, _116, _123, _130 ] }

let _93 = { head = _130, tail = [ _118, _124, _118, _116, _131 ] }

let _92 = { head = _122, tail = [ _126, _130, _118, _129, _131 ] }

let _91 = { head = _119, tail = [ _127, _129, _125, _114, _131 ] }

let _90 = { head = _114, tail = [ _129, _131, _122, _130, _131 ] }

let _89 = { head : _108, tail : _103 }

let _88 = _104 { head = _115, tail = _112 }

let _87 = { head = _122, tail = [ _126, _116, _124, _132, _117, _118 ] }

let _86 = < Primitive : _137 | Custom : _89 >

let _85 = { head = _106, tail = _99 }

let _84 = _86.Primitive

let _83 = _86.Custom

let _82 = { head = _129, tail = [ _118, _124, _118, _114, _130, _118, _117 ] }

let _81 = _104 { head = _136.W, tail = [ _122, _131, _121 ] }

let _80 = _104 _101

let _79 =
      < Sql : Text
      | Var : { name : _89, rawName : Text, paramIndex : Natural }
      >

let _78 =
      { head = _129, tail = [ _118, _116, _127, _129, _117, _122, _126, _120 ] }

let _77 = [ _80 ]

let _76 = [ _104 { head = _122, tail = [ _126, _119, _127 ] } ]

let _75 = _79.Var

let _74 = _79.Sql

let _73 = { head = _102, tail = _99 }

let _72 = { head = _101, tail = _99 }

let _71 = _104 _97

let _70 = _104 _96

let _69 = _84 _137.Text

let _68 = _84 _137.Date

let _67 = { arraySettings : Optional _113, scalar : _86 }

let _66 = _104 _94

let _65 = _104 _91

let _64 = _74 ", "

let _63 =
      _74
        ''
        )
          AND (''

let _62 =
      _74
        ''

        where id = ''

let _61 = [ _65 ]

let _60 = { head = _94, tail = _99 }

let _59 = { head = _91, tail = _99 }

let _58 = { head = _90, tail = _99 }

let _57 = { arraySettings = _107, scalar = _69 }

let _56 = { arraySettings = _107, scalar = _84 _137.Int8 }

let _55 = { arraySettings = _107, scalar = _84 _137.Int4 }

let _54 = { arraySettings = _107, scalar = _68 }

let _53 = { arraySettings = _107, scalar = _84 _137.Bool }

let _52 = _104 _82

let _51 = { head = _82, tail = _99 }

let _50 = _104 _78

let _49 = { head = _78, tail = _99 }

let _48 =
      { head = _101
      , tail = [ _104 { head = _124, tail = [ _122, _123, _118 ] } ]
      }

let _47 = { head = _100, tail = _76 }

let _46 =
      { head = { head = _131, tail = [ _129, _114, _116, _123 ] }, tail = _76 }

let _45 = { head = _97, tail = _77 }

let _44 = { head = _90, tail = _77 }

let _43 = { head = _87, tail = _77 }

let _42 = { head = _87, tail = [ _104 _100 ] }

let _41 = { head = _96, tail = _61 }

let _40 =
      { head = _82
      , tail = [ _104 { head = _114, tail = [ _119, _131, _118, _129 ] } ]
      }

let _39 = { head = _78, tail = _76 }

let _38 = { head = _87, tail = [ _66 ] }

let _37 = { head = _87, tail = _61 }

let _36 = { name : _89, pgName : Text, isNullable : Bool, value : _67 }

let _35 = _75 { name = _85, rawName = "id", paramIndex = 1 }

let _34 = _75 { name = _85, rawName = "id", paramIndex = 0 }

let _33 = List _36

let _32 = { head = _87, tail = [ _52 ] }

let _31 = _75 { name = _72, rawName = "name", paramIndex = 0 }

let _30 = { name = _85, pgName = "id", isNullable = False, value = _56 }

let _29 = { name = _85, pgName = "id", isNullable = False, value = _55 }

let _28 = { head = _87, tail = [ _50 ] }

let _27 = { head = _98, tail = [ _88, _80 ] }

let _26 = _75 { name = _59, rawName = "format", paramIndex = 2 }

let _25 =
      { name = _73
      , pgName = "path"
      , isNullable = False
      , value = { arraySettings = _107, scalar = _84 _137.Ltree }
      }

let _24 = { name = _72, pgName = "name", isNullable = True, value = _57 }

let _23 = { name = _72, pgName = "name", isNullable = False, value = _57 }

let _22 = [ _23 ]

let _21 = _83 _46

let _20 = _75 { name = _51, rawName = "released", paramIndex = 1 }

let _19 = { head = _98, tail = [ _88, _52 ] }

let _18 = _75 { name = _48, rawName = "name_like", paramIndex = 4 }

let _17 = _83 _41

let _16 = { arraySettings = _109, scalar = _21 }

let _15 = _75 { name = _45, rawName = "genre_name", paramIndex = 1 }

let _14 = { name = _51, pgName = "released", isNullable = True, value = _54 }

let _13 = _75 { name = _44, rawName = "artist_name", paramIndex = 0 }

let _12 = { arraySettings = _107, scalar = _17 }

let _11 = { arraySettings = _107, scalar = _83 _39 }

let _10 = _75 { name = _40, rawName = "released_after", paramIndex = 3 }

let _9 =
      { name = { head = _100, tail = _99 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _107, scalar = _83 _47 }
      }

let _8 = { name = _60, pgName = "tracks", isNullable = True, value = _16 }

let _7 =
      < Composite : _33
      | Enum : List { name : _89, pgName : Text }
      | Domain : _67
      >

let _6 = _7.Composite

let _5 = { name = _59, pgName = "format", isNullable = True, value = _12 }

let _4 = { name = _59, pgName = "format", isNullable = False, value = _12 }

let _3 = { head = _30, tail = [] : _33 }

let _2 = { name = _49, pgName = "recording", isNullable = True, value = _11 }

let _1 =
      Some
        { cardinality = _135
        , columns = { head = _30, tail = [ _23, _14, _5, _2 ] }
        }

in  { space =
      { head = { head = _125, tail = _112 }
      , tail = [ _104 { head = _130, tail = [ _128, _114, _116, _118 ] } ]
      }
    , name =
      { head = { head = _125, tail = [ _132, _130, _122, _116 ] }
      , tail =
        [ _104
            { head = _116
            , tail = [ _114, _131, _114, _124, _127, _120, _132, _118 ]
            }
        ]
      }
    , version = { major = 1, minor = 0, patch = 1 }
    , customTypes =
      [ { name = _41
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _7.Enum
              [ { name =
                  { head = { head = _133, tail = [ _122, _126, _134, _124 ] }
                  , tail = _99
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _116, tail = _111 }, tail = _99 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _116
                    , tail = [ _114, _130, _130, _118, _131, _131, _118 ]
                    }
                  , tail = _99
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _117
                    , tail = [ _122, _120, _122, _131, _114, _124 ]
                    }
                  , tail = _99
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _117, tail = [ _133, _117 ] }
                  , tail =
                    [ _104 { head = _114, tail = [ _132, _117, _122, _127 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _130, tail = [ _114, _116, _117 ] }
                  , tail = _99
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _47
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition = _6 [ _24, _2 ]
        }
      , { name = _39
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _6
              [ { name =
                  { head =
                    { head = _130, tail = [ _131, _132, _117, _122, _127 ] }
                  , tail = _77
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _57
                }
              , { name =
                  { head = { head = _116, tail = [ _122, _131, _134 ] }
                  , tail = _99
                  }
                , pgName = "city"
                , isNullable = True
                , value = _57
                }
              , { name =
                  { head =
                    { head = _116
                    , tail = [ _127, _132, _126, _131, _129, _134 ]
                    }
                  , tail = _99
                  }
                , pgName = "country"
                , isNullable = True
                , value = _57
                }
              , { name =
                  { head =
                    { head = _129
                    , tail = [ _118, _116, _127, _129, _117, _118, _117 ]
                    }
                  , tail = [ _104 { head = _117, tail = [ _114, _131, _118 ] } ]
                  }
                , pgName = "recorded_date"
                , isNullable = True
                , value = _54
                }
              ]
        }
      , { name = _46
        , pgSchema = "public"
        , pgName = "track_info"
        , definition =
            _6
              [ { name =
                  { head = { head = _131, tail = [ _122, _131, _124, _118 ] }
                  , tail = _99
                  }
                , pgName = "title"
                , isNullable = True
                , value = _57
                }
              , { name =
                  { head =
                    { head = _117
                    , tail = [ _132, _129, _114, _131, _122, _127, _126 ]
                    }
                  , tail =
                    [ _104
                        { head = _130
                        , tail = [ _118, _116, _127, _126, _117, _130 ]
                        }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _55
                }
              , { name =
                  { head = { head = _131, tail = [ _114, _120, _130 ] }
                  , tail = _99
                  }
                , pgName = "tags"
                , isNullable = True
                , value = { arraySettings = _110, scalar = _69 }
                }
              ]
        }
      ]
    , queries =
      [ { name = { head = _92, tail = [ _70 ] }
        , srcPath = "./queries/insert_album.sql"
        , idempotent = False
        , params =
          [ _23
          , { name = _51, pgName = "released", isNullable = False, value = _54 }
          , _4
          , { name = _49
            , pgName = "recording"
            , isNullable = False
            , value = _11
            }
          ]
        , result = Some { cardinality = _138.Single, columns = _3 }
        , fragments =
          [ _74
              ''
              insert into album (name, released, format, recording)
              values (''
          , _31
          , _64
          , _20
          , _64
          , _26
          , _64
          , _75 { name = _49, rawName = "recording", paramIndex = 3 }
          , _74
              ''
              )
              returning id''
          ]
        }
      , { name =
          { head = _92
          , tail =
            [ _104
                { head = _125
                , tail = [ _132, _124, _131, _122, _128, _124, _118 ]
                }
            , _104 { head = _114, tail = [ _124, _115, _132, _125, _130 ] }
            ]
          }
        , srcPath = "./queries/insert_multiple_albums.sql"
        , idempotent = False
        , params =
          [ { name = _72
            , pgName = "name"
            , isNullable = False
            , value = { arraySettings = _109, scalar = _69 }
            }
          , { name = _51
            , pgName = "released"
            , isNullable = False
            , value = { arraySettings = _109, scalar = _68 }
            }
          , { name = _59
            , pgName = "format"
            , isNullable = False
            , value = { arraySettings = _109, scalar = _17 }
            }
          ]
        , result = Some { cardinality = _135, columns = _3 }
        , fragments =
          [ _74
              ''
              -- This is an example of a bulk-insert (batch-insert) technique.
              -- We pass in all fields as arrays of the same size, and we unnest it to insert multiple rows at once.
              insert into album (name, released, format)
              select *
              from unnest(
                ''
          , _31
          , _74
              ''
              ::text[],
                ''
          , _20
          , _74
              ''
              ::date[],
                ''
          , _26
          , _74
              ''
              ::album_format[]
              )
              returning id''
          ]
        }
      , { name = { head = _93, tail = [ _70, _88, _65 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , idempotent = True
        , params = [ _4 ]
        , result = _1
        , fragments =
          [ _74
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _75 { name = _59, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _93, tail = [ _70, _88, _104 _106 ] }
        , srcPath = "./queries/select_album_by_id.sql"
        , idempotent = True
        , params =
          [ { name = _85, pgName = "id", isNullable = True, value = _56 } ]
        , result = Some
          { cardinality = _138.Optional
          , columns =
            { head = _30
            , tail =
              [ _23
              , _14
              , _5
              , _2
              , { name = _60
                , pgName = "tracks"
                , isNullable = True
                , value = { arraySettings = _110, scalar = _21 }
                }
              , _9
              ]
            }
          }
        , fragments =
          [ _74
              ''
              -- Example of a query selecting 0 or 1 row.
              select *
              from album
              where id = ''
          , _34
          , _74
              ''

              limit 1''
          ]
        }
      , { name = { head = _93, tail = [ _70, _88, _80 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , idempotent = True
        , params = _22
        , result = _1
        , fragments =
          [ _74
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where name = ''
          , _31
          ]
        }
      , { name =
          { head = _93
          , tail =
            [ _70
            , _104 { head = _119, tail = [ _122, _118, _124, _117, _130 ] }
            ]
          }
        , srcPath = "./queries/select_album_fields.sql"
        , idempotent = True
        , params =
          [ { name = _43
            , pgName = "include_name"
            , isNullable = False
            , value = _53
            }
          , { name = _32
            , pgName = "include_released"
            , isNullable = False
            , value = _53
            }
          , { name = _37
            , pgName = "include_format"
            , isNullable = False
            , value = _53
            }
          , { name = _28
            , pgName = "include_recording"
            , isNullable = False
            , value = _53
            }
          , { name = _38
            , pgName = "include_tracks"
            , isNullable = False
            , value = _53
            }
          , { name = _42
            , pgName = "include_disc"
            , isNullable = False
            , value = _53
            }
          , _30
          ]
        , result = Some
          { cardinality = _135
          , columns = { head = _30, tail = [ _24, _14, _5, _2, _8, _9 ] }
          }
        , fragments =
          [ _74
              ''
              -- Demonstrates static query equivalent of dynamic field selection.
              -- Boolean flags control which fields are included in the result,
              -- returning NULL for fields the caller opts out of.
              SELECT
                album.id,
                CASE WHEN ''
          , _75 { name = _43, rawName = "include_name", paramIndex = 0 }
          , _74
              ''
              ${"  "}    THEN album.name      END AS name,
              ${"  "}CASE WHEN ''
          , _75 { name = _32, rawName = "include_released", paramIndex = 1 }
          , _74
              ''
              ${"  "}THEN album.released  END AS released,
              ${"  "}CASE WHEN ''
          , _75 { name = _37, rawName = "include_format", paramIndex = 2 }
          , _74
              ''
              ${"  "}  THEN album.format    END AS format,
              ${"  "}CASE WHEN ''
          , _75 { name = _28, rawName = "include_recording", paramIndex = 3 }
          , _74
              ''
              ${" "}THEN album.recording END AS recording,
              ${" "} CASE WHEN ''
          , _75 { name = _38, rawName = "include_tracks", paramIndex = 4 }
          , _74
              ''
              ${"  "}  THEN album.tracks    END AS tracks,
              ${"  "}CASE WHEN ''
          , _75 { name = _42, rawName = "include_disc", paramIndex = 5 }
          , _74
              ''
                    THEN album.disc      END AS disc
              FROM album
              WHERE album.id = ''
          , _75 { name = _85, rawName = "id", paramIndex = 6 }
          ]
        }
      , { name =
          { head = _93
          , tail =
            [ _70
            , _81
            , _104
                { head = _119, tail = [ _122, _124, _131, _118, _129, _130 ] }
            ]
          }
        , srcPath = "./queries/select_album_with_filters.sql"
        , idempotent = True
        , params =
          [ { name = _44
            , pgName = "artist_name"
            , isNullable = True
            , value = _57
            }
          , { name = _45
            , pgName = "genre_name"
            , isNullable = True
            , value = _57
            }
          , _5
          , { name = _40
            , pgName = "released_after"
            , isNullable = True
            , value = { arraySettings = _107, scalar = _84 _137.Timestamp }
            }
          , { name = _48, pgName = "name_like", isNullable = True, value = _57 }
          , { name = _27
            , pgName = "order_by_name"
            , isNullable = False
            , value = _53
            }
          , { name = _19
            , pgName = "order_by_released"
            , isNullable = False
            , value = _53
            }
          ]
        , result = Some
          { cardinality = _135
          , columns = { head = _30, tail = [ _23, _14, _5 ] }
          }
        , fragments =
          [ _74
              ''
              SELECT
                album.id,
                album.name,
                album.released,
                album.format
              FROM album
              LEFT JOIN album_artist ON album_artist.album = album.id
              LEFT JOIN artist ON artist.id = album_artist.artist
              LEFT JOIN album_genre ON album_genre.album = album.id
              LEFT JOIN genre ON genre.id = album_genre.genre
              WHERE
                (''
          , _13
          , _74 "::text IS NULL OR artist.name = "
          , _13
          , _63
          , _15
          , _74 "::text IS NULL OR genre.name = "
          , _15
          , _63
          , _26
          , _74 "::album_format IS NULL OR album.format = "
          , _26
          , _63
          , _10
          , _74 "::timestamp IS NULL OR album.released >= "
          , _10
          , _63
          , _18
          , _74 "::text IS NULL OR album.name LIKE "
          , _18
          , _74
              ''
              )
              ORDER BY
                CASE WHEN ''
          , _75 { name = _27, rawName = "order_by_name", paramIndex = 5 }
          , _74
              ''
              ${" "}THEN album.name END ASC,
              ${" "} CASE WHEN ''
          , _75 { name = _19, rawName = "order_by_released", paramIndex = 6 }
          , _74 " THEN album.released END DESC"
          ]
        }
      , { name = { head = _93, tail = [ _70, _81, _66 ] }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , idempotent = True
        , params = [ _30 ]
        , result = Some
          { cardinality = _135
          , columns =
            { head = _30
            , tail =
              [ _23
              , { name = _60
                , pgName = "tracks"
                , isNullable = False
                , value = _16
                }
              , _9
              ]
            }
          }
        , fragments =
          [ _74
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _34
          ]
        }
      , { name = { head = _93, tail = [ _71, _88, _104 _90 ] }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , idempotent = True
        , params =
          [ { name = _58, pgName = "artist", isNullable = False, value = _55 } ]
        , result = Some
          { cardinality = _135, columns = { head = _29, tail = _22 } }
        , fragments =
          [ _74
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _75 { name = _58, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name = { head = _93, tail = [ _71, _88, _104 _102 ] }
        , srcPath = "./queries/select_genre_by_path.sql"
        , idempotent = True
        , params = [ _25 ]
        , result = Some
          { cardinality = _135, columns = { head = _29, tail = [ _23, _25 ] } }
        , fragments =
          [ _74
              ''
              select id, name, path
              from genre
              where path <@ ''
          , _75 { name = _73, rawName = "path", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _95
          , tail =
            [ _70
            , _50
            , _104
                { head = _129
                , tail = [ _118, _131, _132, _129, _126, _122, _126, _120 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , idempotent = False
        , params = [ _2, _30 ]
        , result = Some
          { cardinality = _135
          , columns = { head = _30, tail = [ _23, _14, _5, _2, _8, _9 ] }
          }
        , fragments =
          [ _74
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _75 { name = _49, rawName = "recording", paramIndex = 0 }
          , _62
          , _35
          , _74
              ''

              returning *''
          ]
        }
      , { name = { head = _95, tail = [ _70, _52 ] }
        , srcPath = "./queries/update_album_released.sql"
        , idempotent = False
        , params = [ _14, _30 ]
        , result =
            None { cardinality : _138, columns : { head : _36, tail : _33 } }
        , fragments =
          [ _74
              ''
              update album
              set released = ''
          , _75 { name = _51, rawName = "released", paramIndex = 0 }
          , _62
          , _35
          ]
        }
      ]
    , migrations =
      [ { name = "1"
        , sql =
            ''

            create table "genre" (
              "id" int4 not null generated always as identity primary key,
              "name" text not null unique
            );

            create table "artist" (
              "id" int4 not null generated always as identity primary key,
              "name" text not null
            );

            create table "album" (
              "id" int4 not null generated always as identity primary key,
              -- Album name.
              "name" text not null,
              -- The date the album was first released.
              "released" date null
            );

            create table "album_genre" (
              "album" int4 not null references "album",
              "genre" int4 not null references "genre"
            );

            create table "album_artist" (
              "album" int4 not null references "album",
              "artist" int4 not null references "artist",
              -- Whether it is the primary artist
              "primary" bool not null,
              primary key ("album", "artist")
            );
            ''
        }
      , { name = "2"
        , sql =
            ''
            -- In this migration we're changing the type of the album "id" column
            -- from "int4" to "int8".
            -- Since this column is referenced from other tables, we also update them.


            alter table album
            alter column id type int8;

            alter table album_genre
            alter column album type int8;

            alter table album_artist
            alter column album type int8;
            ''
        }
      , { name = "3"
        , sql =
            ''
            -- Add enumeration type for album formats
            create type album_format as enum (
              'Vinyl',
              'CD',
              'Cassette',
              'Digital',
              'DVD-Audio',
              'SACD'
            );

            -- Add composite type for recording session information
            create type recording_info as (
              studio_name text,
              city text,
              country text,
              recorded_date date
            );

            -- Add format column to album table
            alter table album
            add column format album_format null;

            -- Add recording information to album table
            alter table album
            add column recording recording_info null;
            ''
        }
      , { name = "4"
        , sql =
            ''
            -- Composite with array fields: a track in an album
            create type track_info as (
              title text,
              duration_seconds int4,
              tags text[]
            );

            -- Composite with composites: disc information referencing a recording
            create type disc_info as (
              name text,
              recording recording_info
            );

            -- Edge case: array of composites column
            alter table album
            add column tracks track_info[] null;

            -- Edge case: composite with composites column
            alter table album
            add column disc disc_info null;
            ''
        }
      , { name = "5"
        , sql =
            ''
            CREATE INDEX ON album (recording);
            ''
        }
      , { name = "6"
        , sql =
            ''
            -- Add support for hierarchical genre paths.
            create extension if not exists ltree;

            alter table genre
            add column path ltree not null;

            create index on genre using gist (path);''
        }
      ]
    }
