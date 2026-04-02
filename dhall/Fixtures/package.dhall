let Project = (../Project.dhall).Project

in  { _1 = ./1.dhall : Project, _2 = ./2.dhall : Project }
