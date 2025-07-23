let Lude = ../../Lude.dhall

let CodegenKit = ../../CodegenKit.dhall

let Latin = Lude.Structures.LatinChar.Type

let Name = CodegenKit.Name

let a = Latin.A

let b = Latin.B

let c = Latin.C

let d = Latin.D

let e = Latin.E

let f = Latin.F

let g = Latin.G

let h = Latin.H

let i = Latin.I

let j = Latin.J

let k = Latin.K

let l = Latin.L

let m = Latin.M

let n = Latin.N

let o = Latin.O

let p = Latin.P

let q = Latin.Q

let r = Latin.R

let s = Latin.S

let t = Latin.T

let u = Latin.U

let v = Latin.V

let w = Latin.W

let x = Latin.X

let y = Latin.Y

let z = Latin.Z

let concat = Name.concat

let word = Name.word

in  { albumCount = concat (word a [ l, b, u, m ]) [ word c [ o, u, n, t ] ]
    , albumId = concat (word a [ l, b, u, m ]) [ word i [ d ] ]
    , albumTitle = concat (word a [ l, b, u, m ]) [ word t [ i, t, l, e ] ]
    , albumType = concat (word a [ l, b, u, m ]) [ word t [ y, p, e ] ]
    , artist = word a [ r, t, i, s, t ]
    , artistId = concat (word a [ r, t, i, s, t ]) [ word i [ d ] ]
    , artistName = concat (word a [ r, t, i, s, t ]) [ word n [ a, m, e ] ]
    , catalogue = word c [ a, t, a, l, o, g, u, e ]
    , compilation = word c [ o, m, p, i, l, a, t, i, o, n ]
    , createPlaylist =
        concat (word c [ r, e, a, t, e ]) [ word p [ l, a, y, l, i, s, t ] ]
    , createdAt = concat (word c [ r, e, a, t, e, d ]) [ word a [ t ] ]
    , description = word d [ e, s, c, r, i, p, t, i, o, n ]
    , duration = word d [ u, r, a, t, i, o, n ]
    , ep = word e [ p ]
    , genre = word g [ e, n, r, e ]
    , getAlbumsByArtist =
        concat
          (word g [ e, t ])
          [ word a [ l, b, u, m, s ], word b [ y ], word a [ r, t, i, s, t ] ]
    , getArtistsWithTrackCount =
        concat
          (word g [ e, t ])
          [ word a [ r, t, i, s, t, s ]
          , word w [ i, t, h ]
          , word t [ r, a, c, k ]
          , word c [ o, u, n, t ]
          ]
    , getTopTracksByPlayCount =
        concat
          (word g [ e, t ])
          [ word t [ o, p ]
          , word t [ r, a, c, k, s ]
          , word b [ y ]
          , word p [ l, a, y ]
          , word c [ o, u, n, t ]
          ]
    , getTrackDetails =
        concat
          (word g [ e, t ])
          [ word t [ r, a, c, k ], word d [ e, t, a, i, l, s ] ]
    , id = word i [ d ]
    , limit = word l [ i, m, i, t ]
    , live = word l [ i, v, e ]
    , music = word m [ u, s, i, c ]
    , musicCatalogue =
        concat (word m [ u, s, i, c ]) [ word c [ a, t, a, l, o, g, u, e ] ]
    , name = word n [ a, m, e ]
    , playCount = concat (word p [ l, a, y ]) [ word c [ o, u, n, t ] ]
    , playlist = word p [ l, a, y, l, i, s, t ]
    , releaseYear = concat (word r [ e, l, e, a, s, e ]) [ word y [ e, a, r ] ]
    , searchTerm = concat (word s [ e, a, r, c, h ]) [ word t [ e, r, m ] ]
    , searchTracksByTitle =
        concat
          (word s [ e, a, r, c, h ])
          [ word t [ r, a, c, k, s ], word b [ y ], word t [ i, t, l, e ] ]
    , single = word s [ i, n, g, l, e ]
    , soundtrack = word s [ o, u, n, d, t, r, a, c, k ]
    , studio = word s [ t, u, d, i, o ]
    , title = word t [ i, t, l, e ]
    , track = word t [ r, a, c, k ]
    , trackCount = concat (word t [ r, a, c, k ]) [ word c [ o, u, n, t ] ]
    , trackId = concat (word t [ r, a, c, k ]) [ word i [ d ] ]
    , trackNumber = concat (word t [ r, a, c, k ]) [ word n [ u, m, b, e, r ] ]
    , userId = concat (word u [ s, e, r ]) [ word i [ d ] ]
    }
