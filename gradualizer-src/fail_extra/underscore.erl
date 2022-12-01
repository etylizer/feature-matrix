-module(underscore).

-compile([export_all, nowarn_export_all]).

% underscores are anonymous variables
-spec underscore(_) -> _.
underscore(1) ->
    "apa".
