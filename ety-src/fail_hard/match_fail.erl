-module(match_fail).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

-spec foo(atom() | list()) -> integer().
foo(X) ->
    [ _ | _ ] = X,
    length(atom_to_list(X)). % X has type list() here
