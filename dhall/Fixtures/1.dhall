let Model = ../Project.dhall

let Lude = ../Lude.dhall

let CodegenKit = ../CodegenKit.dhall

let LatinChar = Lude.Structures.LatinChar

let Name = CodegenKit.Name

let a = LatinChar.Type.A

let b = LatinChar.Type.B

let c = LatinChar.Type.C

let d = LatinChar.Type.D

let e = LatinChar.Type.E

let f = LatinChar.Type.F

let g = LatinChar.Type.G

let h = LatinChar.Type.H

let i = LatinChar.Type.I

let j = LatinChar.Type.J

let k = LatinChar.Type.K

let l = LatinChar.Type.L

let m = LatinChar.Type.M

let n = LatinChar.Type.N

let o = LatinChar.Type.O

let p = LatinChar.Type.P

let q = LatinChar.Type.Q

let r = LatinChar.Type.R

let s = LatinChar.Type.S

let t = LatinChar.Type.T

let u = LatinChar.Type.U

let v = LatinChar.Type.V

let w = LatinChar.Type.W

let x = LatinChar.Type.X

let y = LatinChar.Type.Y

let z = LatinChar.Type.Z

let name
    : List (List LatinChar.Type) -> Name.Type
    = ./Helpers/name.dhall

in    { name = name [ [ m, u, s, i, c ], [ c, a, t, a, l, o, g, u, e ] ]
      , version = { major = 1, minor = 0, patch = 0 }
      , customTypes =
        [ { name = name [ [ a, l, b, u, m ], [ t, y, p, e ] ]
          , rawName = "album_type"
          , definition =
              Model.CustomTypeDefinition.Enum
                [ { name = name [ [ s, t, u, d, i, o ] ], rawName = "studio" }
                , { name = name [ [ l, i, v, e ] ], rawName = "live" }
                , { name = name [ [ c, o, m, p, i, l, a, t, i, o, n ] ]
                  , rawName = "compilation"
                  }
                , { name = name [ [ s, o, u, n, d, t, r, a, c, k ] ]
                  , rawName = "soundtrack"
                  }
                , { name = name [ [ e, p ] ], rawName = "ep" }
                , { name = name [ [ s, i, n, g, l, e ] ], rawName = "single" }
                ]
          }
        , { name = name [ [ t, r, a, c, k ], [ m, e, t, a, d, a, t, a ] ]
          , rawName = "track_metadata"
          , definition =
              Model.CustomTypeDefinition.Composite
                [ { name = name [ [ t, i, t, l, e ] ]
                  , rawName = "title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ m, e, t, a, d, a, t, a ] ]
                  , rawName = "metadata"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Xml
                    }
                  }
                , { name = name [ [ c, r, e, a, t, e, d ], [ a, t ] ]
                  , rawName = "created_at"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Timestamp
                    }
                  }
                ]
          }
        ]
      , queries =
        [ { name =
              name
                [ [ g, e, t ]
                , [ a, l, b, u, m, s ]
                , [ b, y ]
                , [ a, r, t, i, s, t ]
                ]
          , srcPath = "queries/get_albums_by_artist.sql"
          , params =
            [ { name = name [ [ a, r, t, i, s, t ], [ i, d ] ]
              , rawName = "artist_id"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Multiple
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ t, i, t, l, e ] ]
                  , rawName = "title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ r, e, l, e, a, s, e ], [ y, e, a, r ] ]
                  , rawName = "release_year"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                , { name = name [ [ a, l, b, u, m ], [ t, y, p, e ] ]
                  , rawName = "album_type"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar =
                        Model.Scalar.Custom
                          (name [ [ a, l, b, u, m ], [ t, y, p, e ] ])
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    a.id,
                    a.title,
                    a.release_year,
                    a.album_type
                FROM albums a
                WHERE a.artist_id = ''
            , Model.QueryFragment.Var (name [ [ a, r, t, i, s, t ], [ i, d ] ])
            , Model.QueryFragment.Sql " ORDER BY a.release_year DESC"
            ]
          }
        , { name =
              name
                [ [ s, e, a, r, c, h ]
                , [ t, r, a, c, k, s ]
                , [ b, y ]
                , [ t, i, t, l, e ]
                ]
          , srcPath = "queries/search_tracks_by_title.sql"
          , params =
            [ { name = name [ [ s, e, a, r, c, h ], [ t, e, r, m ] ]
              , rawName = "search_term"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Text
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Multiple
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ t, i, t, l, e ] ]
                  , rawName = "title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ d, u, r, a, t, i, o, n ] ]
                  , rawName = "duration_seconds"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                , { name = name [ [ a, l, b, u, m ], [ t, i, t, l, e ] ]
                  , rawName = "album_title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ a, r, t, i, s, t ], [ n, a, m, e ] ]
                  , rawName = "artist_name"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    t.duration_seconds,
                    a.title as album_title,
                    ar.name as artist_name
                FROM tracks t
                JOIN albums a ON t.album_id = a.id
                JOIN artists ar ON a.artist_id = ar.id
                WHERE t.title ILIKE '%' || ''
            , Model.QueryFragment.Var
                (name [ [ s, e, a, r, c, h ], [ t, e, r, m ] ])
            , Model.QueryFragment.Sql
                " || '%' ORDER BY ar.name, a.title, t.track_number"
            ]
          }
        , { name =
              name [ [ g, e, t ], [ t, r, a, c, k ], [ d, e, t, a, i, l, s ] ]
          , srcPath = "queries/get_track_details.sql"
          , params =
            [ { name = name [ [ t, r, a, c, k ], [ i, d ] ]
              , rawName = "track_id"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Single
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ t, i, t, l, e ] ]
                  , rawName = "title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ d, u, r, a, t, i, o, n ] ]
                  , rawName = "duration_seconds"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                , { name = name [ [ t, r, a, c, k ], [ n, u, m, b, e, r ] ]
                  , rawName = "track_number"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                , { name = name [ [ a, l, b, u, m ], [ i, d ] ]
                  , rawName = "album_id"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                , { name = name [ [ a, l, b, u, m ], [ t, i, t, l, e ] ]
                  , rawName = "album_title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ a, r, t, i, s, t ], [ i, d ] ]
                  , rawName = "artist_id"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                    }
                  }
                , { name = name [ [ a, r, t, i, s, t ], [ n, a, m, e ] ]
                  , rawName = "artist_name"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ g, e, n, r, e ] ]
                  , rawName = "genre"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    t.duration_seconds,
                    t.track_number,
                    a.id as album_id,
                    a.title as album_title,
                    ar.id as artist_id,
                    ar.name as artist_name,
                    g.name as genre
                FROM tracks t
                JOIN albums a ON t.album_id = a.id
                JOIN artists ar ON a.artist_id = ar.id
                LEFT JOIN genres g ON t.genre_id = g.id
                WHERE t.id = ''
            , Model.QueryFragment.Var (name [ [ t, r, a, c, k ], [ i, d ] ])
            ]
          }
        , { name =
              name
                [ [ g, e, t ]
                , [ a, r, t, i, s, t, s ]
                , [ w, i, t, h ]
                , [ t, r, a, c, k ]
                , [ c, o, u, n, t ]
                ]
          , srcPath = "queries/get_artists_with_track_count.sql"
          , params = [] : List Model.Member
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Multiple
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ n, a, m, e ] ]
                  , rawName = "name"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ t, r, a, c, k ], [ c, o, u, n, t ] ]
                  , rawName = "track_count"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                , { name = name [ [ a, l, b, u, m ], [ c, o, u, n, t ] ]
                  , rawName = "album_count"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    ar.id,
                    ar.name,
                    COUNT(DISTINCT t.id) as track_count,
                    COUNT(DISTINCT a.id) as album_count
                FROM artists ar
                LEFT JOIN albums a ON ar.id = a.artist_id
                LEFT JOIN tracks t ON a.id = t.album_id
                GROUP BY ar.id, ar.name
                ORDER BY track_count DESC''
            ]
          }
        , { name = name [ [ c, r, e, a, t, e ], [ p, l, a, y, l, i, s, t ] ]
          , srcPath = "queries/create_playlist.sql"
          , params =
            [ { name = name [ [ n, a, m, e ] ]
              , rawName = "name"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Text
                }
              }
            , { name = name [ [ d, e, s, c, r, i, p, t, i, o, n ] ]
              , rawName = "description"
              , isNullable = True
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Text
                }
              }
            , { name = name [ [ u, s, e, r ], [ i, d ] ]
              , rawName = "user_id"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Single
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ n, a, m, e ] ]
                  , rawName = "name"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ c, r, e, a, t, e, d ], [ a, t ] ]
                  , rawName = "created_at"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Timestamp
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                INSERT INTO playlists (name, description, user_id, created_at)
                VALUES (''
            , Model.QueryFragment.Var (name [ [ n, a, m, e ] ])
            , Model.QueryFragment.Sql ", "
            , Model.QueryFragment.Var
                (name [ [ d, e, s, c, r, i, p, t, i, o, n ] ])
            , Model.QueryFragment.Sql ", "
            , Model.QueryFragment.Var (name [ [ u, s, e, r ], [ i, d ] ])
            , Model.QueryFragment.Sql
                ''
                , NOW())
                RETURNING id, name, created_at''
            ]
          }
        , { name =
              name
                [ [ g, e, t ]
                , [ t, o, p ]
                , [ t, r, a, c, k, s ]
                , [ b, y ]
                , [ p, l, a, y ]
                , [ c, o, u, n, t ]
                ]
          , srcPath = "queries/get_top_tracks_by_play_count.sql"
          , params =
            [ { name = name [ [ l, i, m, i, t ] ]
              , rawName = "limit"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Multiple
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ t, i, t, l, e ] ]
                  , rawName = "title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ a, r, t, i, s, t ], [ n, a, m, e ] ]
                  , rawName = "artist_name"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ a, l, b, u, m ], [ t, i, t, l, e ] ]
                  , rawName = "album_title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ p, l, a, y ], [ c, o, u, n, t ] ]
                  , rawName = "play_count"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Int4
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    ar.name as artist_name,
                    a.title as album_title,
                    COALESCE(p.play_count, 0) as play_count
                FROM tracks t
                JOIN albums a ON t.album_id = a.id
                JOIN artists ar ON a.artist_id = ar.id
                LEFT JOIN (
                    SELECT track_id, COUNT(*) as play_count
                    FROM play_history
                    GROUP BY track_id
                ) p ON t.id = p.track_id
                ORDER BY play_count DESC
                LIMIT ''
            , Model.QueryFragment.Var (name [ [ l, i, m, i, t ] ])
            ]
          }
        , { name =
              name
                [ [ g, e, t ]
                , [ t, r, a, c, k ]
                , [ m, e, t, a, d, a, t, a ]
                , [ x, m, l ]
                ]
          , srcPath = "queries/get_track_metadata_xml.sql"
          , params =
            [ { name = name [ [ t, r, a, c, k ], [ i, d ] ]
              , rawName = "track_id"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Single
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ m, e, t, a, d, a, t, a ] ]
                  , rawName = "metadata"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Xml
                    }
                  }
                , { name = name [ [ c, u, s, t, o, m ], [ t, a, g, s ] ]
                  , rawName = "custom_tags"
                  , isNullable = True
                  , value =
                    { arraySettings = Some
                      { dimensionality = 1, elementIsNullable = True }
                    , scalar = Model.Scalar.Primitive Model.Primitive.Xml
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.metadata_xml as metadata,
                    t.custom_tags_xml_array as custom_tags
                FROM tracks t
                WHERE t.id = ''
            , Model.QueryFragment.Var (name [ [ t, r, a, c, k ], [ i, d ] ])
            ]
          }
        , { name =
              name
                [ [ s, e, a, r, c, h ]
                , [ t, r, a, c, k, s ]
                , [ b, y ]
                , [ x, m, l ]
                , [ m, e, t, a, d, a, t, a ]
                ]
          , srcPath = "queries/search_tracks_by_xml_metadata.sql"
          , params =
            [ { name = name [ [ x, m, l ], [ q, u, e, r, y ] ]
              , rawName = "xml_query"
              , isNullable = False
              , value =
                { arraySettings = None Model.ArraySettings
                , scalar = Model.Scalar.Primitive Model.Primitive.Xml
                }
              }
            ]
          , result = Some
            { cardinality = Model.ResultRowsCardinality.Multiple
            , columns =
              { head =
                { name = name [ [ i, d ] ]
                , rawName = "id"
                , isNullable = False
                , value =
                  { arraySettings = None Model.ArraySettings
                  , scalar = Model.Scalar.Primitive Model.Primitive.Uuid
                  }
                }
              , tail =
                [ { name = name [ [ t, i, t, l, e ] ]
                  , rawName = "title"
                  , isNullable = False
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Text
                    }
                  }
                , { name = name [ [ m, e, t, a, d, a, t, a ] ]
                  , rawName = "metadata"
                  , isNullable = True
                  , value =
                    { arraySettings = None Model.ArraySettings
                    , scalar = Model.Scalar.Primitive Model.Primitive.Xml
                    }
                  }
                ]
              }
            }
          , fragments =
            [ Model.QueryFragment.Sql
                ''
                SELECT 
                    t.id,
                    t.title,
                    t.metadata_xml as metadata
                FROM tracks t
                WHERE xpath_exists(''
            , Model.QueryFragment.Var (name [ [ x, m, l ], [ q, u, e, r, y ] ])
            , Model.QueryFragment.Sql ", t.metadata_xml) ORDER BY t.title"
            ]
          }
        ]
      }
    : Model.Project
