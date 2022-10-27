-module(match).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

-spec foo(atom() | list()) -> integer().
foo(X) when is_atom(X) -> 2;
foo(X) ->
    length(X). % X has type list() here