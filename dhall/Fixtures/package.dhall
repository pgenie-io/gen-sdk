let Project = (../Project.dhall).Project

in  { Demo = ./Demo.dhall : Project,
  AllTypes = ./AllTypes.dhall : Project
 }
