let Version = { major : Natural, minor : Natural, patch : Natural }

let Name = List Text

let Project = { name : Name, version : Version }

in  { Project, Version, Name }
