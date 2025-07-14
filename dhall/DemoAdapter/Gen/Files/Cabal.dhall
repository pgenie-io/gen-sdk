let Prelude = ../../Prelude.dhall

let Input =
      { packageName : Text
      , publicModules : List Text
      , privateModules : List Text
      }

let Output = { path : Text, content : Text }

let compile
    : Input -> Output
    = \(input : Input) ->
        let packageName = input.packageName

        let publicModules = Prelude.Text.concatSep "\n" input.publicModules

        let privateModules = Prelude.Text.concatSep "\n" input.privateModules

        let path = "${packageName}.cabal"

        let content =
              ''
              name: ${packageName}
              version: 0

              library
                default-language: Haskell2010
                default-extensions: ApplicativeDo, Arrows, BangPatterns, BlockArguments, ConstraintKinds, DataKinds, DefaultSignatures, DeriveAnyClass, DeriveDataTypeable, DeriveFoldable, DeriveFunctor, DeriveGeneric, DeriveTraversable, DerivingStrategies, DerivingVia, DuplicateRecordFields, EmptyDataDecls, FlexibleContexts, FlexibleInstances, FunctionalDependencies, GADTs, GeneralizedNewtypeDeriving, ImportQualifiedPost, LambdaCase, LiberalTypeSynonyms, MagicHash, MultiParamTypeClasses, MultiWayIf, NamedFieldPuns, NoFieldSelectors, NoImplicitPrelude, NoMonomorphismRestriction, NumericUnderscores, OverloadedRecordDot, OverloadedStrings, ParallelListComp, PatternGuards, QuasiQuotes, RankNTypes, RecordWildCards, ScopedTypeVariables, StandaloneDeriving, StrictData, TemplateHaskell, TupleSections, TypeApplications, TypeFamilies, TypeOperators, UnboxedTuples, ViewPatterns 
                hs-source-dirs: library
                exposed-modules:
                  ${publicModules}

                other-modules:
                  ${privateModules}

                build-depends:
                  aeson,
                  base,
                  bytestring,
                  containers,
                  hasql,
                  text,
                  time,
                  uuid,
                  vector,
              ''

        in  { path, content }

in  { Input, Output, compile }
