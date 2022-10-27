-module(if_refine_fail1).
-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

% spec is wrong for input 11.
-spec bar(integer()) -> 0..10.
bar(X) ->
    if X < 0 -> 0;
       X > 11 -> 10;
       true -> X
    end.

my_test() ->
    ?assertEqual(0, bar(-1)).
