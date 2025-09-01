-- Possibly successful result of compilation accompanied by a list of reports.
--
-- When the result is present, the reports can be interpreted as warnings,
-- when absent, they indicate errors.
\(A : Type) ->
  { reports : List { path : List Text, message : Text }, result : Optional A }
