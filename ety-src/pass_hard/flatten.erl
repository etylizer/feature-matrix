-module(flatten).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

% Type for flatten from the erlang lib
-type deepList() :: [term() | deepList()].

-spec flatten_erl(deepList()) -> list().
flatten_erl([]) -> [];
flatten_erl([H | T]) -> flatten_erl(H) ++ flatten_erl(T);
flatten_erl(X) -> [X].

my_test() ->
    ?assertEqual([1,2,3,4,5], flatten_erl([1, [2,3,[4, [5]]]])).

