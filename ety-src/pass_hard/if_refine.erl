-module(if_refine).
-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

-spec bar(integer()) -> 0..10.
bar(X) ->
    if 
       X > 10 -> 10;
       true -> X
    end.

my_test() ->
    ?assertEqual(0, bar(-1)).
