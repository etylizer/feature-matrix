-module (dyn_1).
-export([say_hello/2, run/0, invoke/2]).

say_hello(_, 0) -> ok;
say_hello(X, N) ->
    io:format("Hello ~s~n", [X]),
    say_hello(X, N - 1).

-spec invoke(atom(), integer()) -> any().
invoke(X, N) -> apply(?MODULE, X, ["Stefan", N]).

run() ->
  % typo
  invoke(sya_hello, 3).
