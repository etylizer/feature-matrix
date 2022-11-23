-module(if_refine).
-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

-spec bar(integer() | atom()) -> 0..10.
bar(X) ->
    if X when is_atom(X) -> 10;
       X when is_integer(X) -> X
    end.

my_test() ->
    ?assertEqual(0, bar(-1)).
