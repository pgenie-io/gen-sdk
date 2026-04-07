let _132 = < Optional | Single | Multiple >

let _131 =
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

let _130 =
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

let _129 = _132.Multiple

let _128 = _130.Y

let _127 = _130.V

let _126 = _130.U

let _125 = _130.T

let _124 = _130.S

let _123 = _130.R

let _122 = _130.P

let _121 = _130.O

let _120 = _130.N

let _119 = _130.M

let _118 = _130.L

let _117 = _130.K

let _116 = _130.I

let _115 = _130.G

let _114 = _130.F

let _113 = _130.E

let _112 = _130.D

let _111 = _130.C

let _110 = _130.B

let _109 = _130.A

let _108 = { dimensionality : Natural, elementIsNullable : Bool }

let _107 = [ _128 ]

let _106 = [ _112 ]

let _105 = Some { dimensionality = 1, elementIsNullable = True }

let _104 = { head : _130, tail : List _130 }

let _103 = None _108

let _102 = { head = _116, tail = _106 }

let _101 = < Word : _104 | Number : Natural >

let _100 = _101.Word

let _99 = List _101

let _98 = { head = _120, tail = [ _109, _119, _113 ] }

let _97 = { head = _112, tail = [ _116, _124, _111 ] }

let _96 = [] : _99

let _95 = { head = _121, tail = [ _123, _112, _113, _123 ] }

let _94 = { head = _115, tail = [ _113, _120, _123, _113 ] }

let _93 = { head = _109, tail = [ _118, _110, _126, _119 ] }

let _92 = { head = _126, tail = [ _122, _112, _109, _125, _113 ] }

let _91 = { head = _125, tail = [ _123, _109, _111, _117, _124 ] }

let _90 = { head = _124, tail = [ _113, _118, _113, _111, _125 ] }

let _89 = { head = _116, tail = [ _120, _124, _113, _123, _125 ] }

let _88 = { head = _114, tail = [ _121, _123, _119, _109, _125 ] }

let _87 = { head = _109, tail = [ _123, _125, _116, _124, _125 ] }

let _86 = { head : _104, tail : _99 }

let _85 = _100 { head = _110, tail = _107 }

let _84 = { head = _116, tail = [ _120, _111, _118, _126, _112, _113 ] }

let _83 = < Primitive : _131 | Custom : _86 >

let _82 = { head = _102, tail = _96 }

let _81 = _83.Primitive

let _80 = _83.Custom

let _79 = { head = _123, tail = [ _113, _118, _113, _109, _124, _113, _112 ] }

let _78 = _100 { head = _130.W, tail = [ _116, _125, _130.H ] }

let _77 = _100 _98

let _76 =
      < Sql : Text
      | Var : { name : _86, rawName : Text, paramIndex : Natural }
      >

let _75 =
      { head = _123, tail = [ _113, _111, _121, _123, _112, _116, _120, _115 ] }

let _74 = [ _77 ]

let _73 = [ _100 { head = _116, tail = [ _120, _114, _121 ] } ]

let _72 = _76.Var

let _71 = _76.Sql

let _70 = { head = _98, tail = _96 }

let _69 = _100 _93

let _68 = _81 _131.Text

let _67 = _81 _131.Date

let _66 = { arraySettings : Optional _108, scalar : _83 }

let _65 = _100 _91

let _64 = _100 _88

let _63 = _71 ", "

let _62 =
      _71
        ''
        )
          AND (''

let _61 =
      _71
        ''

        where id = ''

let _60 = [ _64 ]

let _59 = { head = _91, tail = _96 }

let _58 = { head = _88, tail = _96 }

let _57 = { head = _87, tail = _96 }

let _56 = { arraySettings = _105, scalar = _68 }

let _55 = { arraySettings = _103, scalar = _68 }

let _54 = { arraySettings = _103, scalar = _81 _131.Int8 }

let _53 = { arraySettings = _103, scalar = _81 _131.Int4 }

let _52 = { arraySettings = _103, scalar = _67 }

let _51 = { arraySettings = _103, scalar = _81 _131.Bool }

let _50 = _100 _79

let _49 = { head = _79, tail = _96 }

let _48 = _100 _75

let _47 = { head = _75, tail = _96 }

let _46 =
      { head = _98
      , tail = [ _100 { head = _118, tail = [ _116, _117, _113 ] } ]
      }

let _45 = { head = _97, tail = _73 }

let _44 =
      { head = { head = _125, tail = [ _123, _109, _111, _117 ] }, tail = _73 }

let _43 = { head = _94, tail = _74 }

let _42 = { head = _87, tail = _74 }

let _41 = { head = _84, tail = _74 }

let _40 = { head = _84, tail = [ _100 _97 ] }

let _39 = { head = _93, tail = _60 }

let _38 =
      { head = _79
      , tail = [ _100 { head = _109, tail = [ _114, _125, _113, _123 ] } ]
      }

let _37 = { head = _75, tail = _73 }

let _36 = { head = _84, tail = [ _65 ] }

let _35 = { head = _84, tail = _60 }

let _34 = { name : _86, pgName : Text, isNullable : Bool, value : _66 }

let _33 = _72 { name = _82, rawName = "id", paramIndex = 1 }

let _32 = _72 { name = _82, rawName = "id", paramIndex = 0 }

let _31 = List _34

let _30 = { head = _84, tail = [ _50 ] }

let _29 = _72 { name = _70, rawName = "name", paramIndex = 0 }

let _28 = { name = _82, pgName = "id", isNullable = False, value = _54 }

let _27 = { head = _84, tail = [ _48 ] }

let _26 = { head = _95, tail = [ _85, _77 ] }

let _25 = _72 { name = _58, rawName = "format", paramIndex = 2 }

let _24 = { name = _70, pgName = "name", isNullable = True, value = _55 }

let _23 = { name = _70, pgName = "name", isNullable = False, value = _55 }

let _22 = [ _23 ]

let _21 = _80 _44

let _20 = _72 { name = _49, rawName = "released", paramIndex = 1 }

let _19 = { head = _95, tail = [ _85, _50 ] }

let _18 = _72 { name = _46, rawName = "name_like", paramIndex = 4 }

let _17 = _80 _39

let _16 =
      { arraySettings = Some { dimensionality = 1, elementIsNullable = False }
      , scalar = _21
      }

let _15 = _72 { name = _43, rawName = "genre_name", paramIndex = 1 }

let _14 = { name = _49, pgName = "released", isNullable = True, value = _52 }

let _13 = _72 { name = _42, rawName = "artist_name", paramIndex = 0 }

let _12 = { arraySettings = _103, scalar = _17 }

let _11 = { arraySettings = _103, scalar = _80 _37 }

let _10 = _72 { name = _38, rawName = "released_after", paramIndex = 3 }

let _9 =
      { name = { head = _97, tail = _96 }
      , pgName = "disc"
      , isNullable = True
      , value = { arraySettings = _103, scalar = _80 _45 }
      }

let _8 = { name = _59, pgName = "tracks", isNullable = True, value = _16 }

let _7 =
      < Composite : _31
      | Enum : List { name : _86, pgName : Text }
      | Domain : _66
      >

let _6 = _7.Composite

let _5 = { name = _58, pgName = "format", isNullable = True, value = _12 }

let _4 = { name = _58, pgName = "format", isNullable = False, value = _12 }

let _3 = { head = _28, tail = [] : _31 }

let _2 = { name = _47, pgName = "recording", isNullable = True, value = _11 }

let _1 =
      Some
        { cardinality = _129
        , columns = { head = _28, tail = [ _23, _14, _5, _2 ] }
        }

in  { space =
      { head = { head = _119, tail = _107 }
      , tail = [ _100 { head = _124, tail = [ _122, _109, _111, _113 ] } ]
      }
    , name =
      { head = { head = _119, tail = [ _126, _124, _116, _111 ] }
      , tail =
        [ _100
            { head = _111
            , tail = [ _109, _125, _109, _118, _121, _115, _126, _113 ]
            }
        ]
      }
    , version = { major = 1, minor = 0, patch = 1 }
    , customTypes =
      [ { name = _39
        , pgSchema = "public"
        , pgName = "album_format"
        , definition =
            _7.Enum
              [ { name =
                  { head = { head = _127, tail = [ _116, _120, _128, _118 ] }
                  , tail = _96
                  }
                , pgName = "Vinyl"
                }
              , { name = { head = { head = _111, tail = _106 }, tail = _96 }
                , pgName = "CD"
                }
              , { name =
                  { head =
                    { head = _111
                    , tail = [ _109, _124, _124, _113, _125, _125, _113 ]
                    }
                  , tail = _96
                  }
                , pgName = "Cassette"
                }
              , { name =
                  { head =
                    { head = _112
                    , tail = [ _116, _115, _116, _125, _109, _118 ]
                    }
                  , tail = _96
                  }
                , pgName = "Digital"
                }
              , { name =
                  { head = { head = _112, tail = [ _127, _112 ] }
                  , tail =
                    [ _100 { head = _109, tail = [ _126, _112, _116, _121 ] } ]
                  }
                , pgName = "DVD-Audio"
                }
              , { name =
                  { head = { head = _124, tail = [ _109, _111, _112 ] }
                  , tail = _96
                  }
                , pgName = "SACD"
                }
              ]
        }
      , { name = _45
        , pgSchema = "public"
        , pgName = "disc_info"
        , definition = _6 [ _24, _2 ]
        }
      , { name = _37
        , pgSchema = "public"
        , pgName = "recording_info"
        , definition =
            _6
              [ { name =
                  { head =
                    { head = _124, tail = [ _125, _126, _112, _116, _121 ] }
                  , tail = _74
                  }
                , pgName = "studio_name"
                , isNullable = True
                , value = _55
                }
              , { name =
                  { head = { head = _111, tail = [ _116, _125, _128 ] }
                  , tail = _96
                  }
                , pgName = "city"
                , isNullable = True
                , value = _55
                }
              , { name =
                  { head =
                    { head = _111
                    , tail = [ _121, _126, _120, _125, _123, _128 ]
                    }
                  , tail = _96
                  }
                , pgName = "country"
                , isNullable = True
                , value = _55
                }
              , { name =
                  { head =
                    { head = _123
                    , tail = [ _113, _111, _121, _123, _112, _113, _112 ]
                    }
                  , tail = [ _100 { head = _112, tail = [ _109, _125, _113 ] } ]
                  }
                , pgName = "recorded_date"
                , isNullable = True
                , value = _52
                }
              ]
        }
      , { name = _44
        , pgSchema = "public"
        , pgName = "track_info"
        , definition =
            _6
              [ { name =
                  { head = { head = _125, tail = [ _116, _125, _118, _113 ] }
                  , tail = _96
                  }
                , pgName = "title"
                , isNullable = True
                , value = _55
                }
              , { name =
                  { head =
                    { head = _112
                    , tail = [ _126, _123, _109, _125, _116, _121, _120 ]
                    }
                  , tail =
                    [ _100
                        { head = _124
                        , tail = [ _113, _111, _121, _120, _112, _124 ]
                        }
                    ]
                  }
                , pgName = "duration_seconds"
                , isNullable = True
                , value = _53
                }
              , { name =
                  { head = { head = _125, tail = [ _109, _115, _124 ] }
                  , tail = _96
                  }
                , pgName = "tags"
                , isNullable = True
                , value = _56
                }
              ]
        }
      ]
    , queries =
      [ { name = { head = _89, tail = [ _69 ] }
        , srcPath = "./queries/insert_album.sql"
        , params =
          [ _23
          , { name = _49, pgName = "released", isNullable = False, value = _52 }
          , _4
          , { name = _47
            , pgName = "recording"
            , isNullable = False
            , value = _11
            }
          ]
        , result = Some { cardinality = _132.Single, columns = _3 }
        , fragments =
          [ _71
              ''
              insert into album (name, released, format, recording)
              values (''
          , _29
          , _63
          , _20
          , _63
          , _25
          , _63
          , _72 { name = _47, rawName = "recording", paramIndex = 3 }
          , _71
              ''
              )
              returning id''
          ]
        }
      , { name =
          { head = _89
          , tail =
            [ _100
                { head = _119
                , tail = [ _126, _118, _125, _116, _122, _118, _113 ]
                }
            , _100 { head = _109, tail = [ _118, _110, _126, _119, _124 ] }
            ]
          }
        , srcPath = "./queries/insert_multiple_albums.sql"
        , params =
          [ { name = _70, pgName = "name", isNullable = True, value = _56 }
          , { name = _49
            , pgName = "released"
            , isNullable = True
            , value = { arraySettings = _105, scalar = _67 }
            }
          , { name = _58
            , pgName = "format"
            , isNullable = True
            , value = { arraySettings = _105, scalar = _17 }
            }
          ]
        , result = Some { cardinality = _129, columns = _3 }
        , fragments =
          [ _71
              ''
              -- This is an example of a bulk-insert (batch-insert) technique.
              -- We pass in all fields as arrays of the same size, and we unnest it to insert multiple rows at once.
              insert into album (name, released, format)
              select *
              from unnest(
                ''
          , _29
          , _71
              ''
              ::text[],
                ''
          , _20
          , _71
              ''
              ::date[],
                ''
          , _25
          , _71
              ''
              ::album_format[]
              )
              returning id''
          ]
        }
      , { name = { head = _90, tail = [ _69, _85, _64 ] }
        , srcPath = "./queries/select_album_by_format.sql"
        , params = [ _4 ]
        , result = _1
        , fragments =
          [ _71
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where format = ''
          , _72 { name = _58, rawName = "format", paramIndex = 0 }
          ]
        }
      , { name = { head = _90, tail = [ _69, _85, _100 _102 ] }
        , srcPath = "./queries/select_album_by_id.sql"
        , params =
          [ { name = _82, pgName = "id", isNullable = True, value = _54 } ]
        , result = Some
          { cardinality = _132.Optional
          , columns =
            { head = _28
            , tail =
              [ _23
              , _14
              , _5
              , _2
              , { name = _59
                , pgName = "tracks"
                , isNullable = True
                , value = { arraySettings = _105, scalar = _21 }
                }
              , _9
              ]
            }
          }
        , fragments =
          [ _71
              ''
              -- Example of a query selecting 0 or 1 row.
              select *
              from album
              where id = ''
          , _32
          , _71
              ''

              limit 1''
          ]
        }
      , { name = { head = _90, tail = [ _69, _85, _77 ] }
        , srcPath = "./queries/select_album_by_name.sql"
        , params = _22
        , result = _1
        , fragments =
          [ _71
              ''
              select
                id,
                name,
                released,
                format,
                recording
              from album
              where name = ''
          , _29
          ]
        }
      , { name =
          { head = _90
          , tail =
            [ _69
            , _100 { head = _114, tail = [ _116, _113, _118, _112, _124 ] }
            ]
          }
        , srcPath = "./queries/select_album_fields.sql"
        , params =
          [ { name = _41
            , pgName = "include_name"
            , isNullable = False
            , value = _51
            }
          , { name = _30
            , pgName = "include_released"
            , isNullable = False
            , value = _51
            }
          , { name = _35
            , pgName = "include_format"
            , isNullable = False
            , value = _51
            }
          , { name = _27
            , pgName = "include_recording"
            , isNullable = False
            , value = _51
            }
          , { name = _36
            , pgName = "include_tracks"
            , isNullable = False
            , value = _51
            }
          , { name = _40
            , pgName = "include_disc"
            , isNullable = False
            , value = _51
            }
          , _28
          ]
        , result = Some
          { cardinality = _129
          , columns = { head = _28, tail = [ _24, _14, _5, _2, _8, _9 ] }
          }
        , fragments =
          [ _71
              ''
              -- Demonstrates static query equivalent of dynamic field selection.
              -- Boolean flags control which fields are included in the result,
              -- returning NULL for fields the caller opts out of.
              SELECT
                album.id,
                CASE WHEN ''
          , _72 { name = _41, rawName = "include_name", paramIndex = 0 }
          , _71
              ''
              ${"  "}    THEN album.name      END AS name,
              ${"  "}CASE WHEN ''
          , _72 { name = _30, rawName = "include_released", paramIndex = 1 }
          , _71
              ''
              ${"  "}THEN album.released  END AS released,
              ${"  "}CASE WHEN ''
          , _72 { name = _35, rawName = "include_format", paramIndex = 2 }
          , _71
              ''
              ${"  "}  THEN album.format    END AS format,
              ${"  "}CASE WHEN ''
          , _72 { name = _27, rawName = "include_recording", paramIndex = 3 }
          , _71
              ''
              ${" "}THEN album.recording END AS recording,
              ${" "} CASE WHEN ''
          , _72 { name = _36, rawName = "include_tracks", paramIndex = 4 }
          , _71
              ''
              ${"  "}  THEN album.tracks    END AS tracks,
              ${"  "}CASE WHEN ''
          , _72 { name = _40, rawName = "include_disc", paramIndex = 5 }
          , _71
              ''
                    THEN album.disc      END AS disc
              FROM album
              WHERE album.id = ''
          , _72 { name = _82, rawName = "id", paramIndex = 6 }
          ]
        }
      , { name =
          { head = _90
          , tail =
            [ _69
            , _78
            , _100
                { head = _114, tail = [ _116, _118, _125, _113, _123, _124 ] }
            ]
          }
        , srcPath = "./queries/select_album_with_filters.sql"
        , params =
          [ { name = _42
            , pgName = "artist_name"
            , isNullable = True
            , value = _55
            }
          , { name = _43
            , pgName = "genre_name"
            , isNullable = True
            , value = _55
            }
          , _5
          , { name = _38
            , pgName = "released_after"
            , isNullable = True
            , value = { arraySettings = _103, scalar = _81 _131.Timestamp }
            }
          , { name = _46, pgName = "name_like", isNullable = True, value = _55 }
          , { name = _26
            , pgName = "order_by_name"
            , isNullable = False
            , value = _51
            }
          , { name = _19
            , pgName = "order_by_released"
            , isNullable = False
            , value = _51
            }
          ]
        , result = Some
          { cardinality = _129
          , columns = { head = _28, tail = [ _23, _14, _5 ] }
          }
        , fragments =
          [ _71
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
          , _71 "::text IS NULL OR artist.name = "
          , _13
          , _62
          , _15
          , _71 "::text IS NULL OR genre.name = "
          , _15
          , _62
          , _25
          , _71 "::album_format IS NULL OR album.format = "
          , _25
          , _62
          , _10
          , _71 "::timestamp IS NULL OR album.released >= "
          , _10
          , _62
          , _18
          , _71 "::text IS NULL OR album.name LIKE "
          , _18
          , _71
              ''
              )
              ORDER BY
                CASE WHEN ''
          , _72 { name = _26, rawName = "order_by_name", paramIndex = 5 }
          , _71
              ''
              ${" "}THEN album.name END ASC,
              ${" "} CASE WHEN ''
          , _72 { name = _19, rawName = "order_by_released", paramIndex = 6 }
          , _71 " THEN album.released END DESC"
          ]
        }
      , { name = { head = _90, tail = [ _69, _78, _65 ] }
        , srcPath = "./queries/select_album_with_tracks.sql"
        , params = [ _28 ]
        , result = Some
          { cardinality = _129
          , columns =
            { head = _28
            , tail =
              [ _23
              , { name = _59
                , pgName = "tracks"
                , isNullable = False
                , value = _16
                }
              , _9
              ]
            }
          }
        , fragments =
          [ _71
              ''
              select id, name, tracks, disc
              from album
              where id = ''
          , _32
          ]
        }
      , { name = { head = _90, tail = [ _100 _94, _85, _100 _87 ] }
        , srcPath = "./queries/select_genre_by_artist.sql"
        , params =
          [ { name = _57, pgName = "artist", isNullable = False, value = _53 } ]
        , result = Some
          { cardinality = _129
          , columns =
            { head =
              { name = _82, pgName = "id", isNullable = False, value = _53 }
            , tail = _22
            }
          }
        , fragments =
          [ _71
              ''
              select id, genre.name
              from genre
              left join album_genre on album_genre.genre = genre.id
              left join album_artist on album_artist.album = album_genre.album
              where album_artist.artist = ''
          , _72 { name = _57, rawName = "artist", paramIndex = 0 }
          ]
        }
      , { name =
          { head = _92
          , tail =
            [ _69
            , _48
            , _100
                { head = _123
                , tail = [ _113, _125, _126, _123, _120, _116, _120, _115 ]
                }
            ]
          }
        , srcPath = "./queries/update_album_recording_returning.sql"
        , params = [ _2, _28 ]
        , result = Some
          { cardinality = _129
          , columns = { head = _28, tail = [ _23, _14, _5, _2, _8, _9 ] }
          }
        , fragments =
          [ _71
              ''
              -- Update album recording information
              update album
              set recording = ''
          , _72 { name = _47, rawName = "recording", paramIndex = 0 }
          , _61
          , _33
          , _71
              ''

              returning *''
          ]
        }
      , { name = { head = _92, tail = [ _69, _50 ] }
        , srcPath = "./queries/update_album_released.sql"
        , params = [ _14, _28 ]
        , result =
            None { cardinality : _132, columns : { head : _34, tail : _31 } }
        , fragments =
          [ _71
              ''
              update album
              set released = ''
          , _72 { name = _49, rawName = "released", paramIndex = 0 }
          , _61
          , _33
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
      ]
    }
