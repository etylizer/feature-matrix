-module(catch_expr_pass).

-export([foo/1]).

-spec foo(ok) -> ok.
foo(X) ->
    A = (catch (bar(X))),
    A.


-spec bar(any()) -> any().
bar(X) -> 2.

%-spec g() -> ok.
%g() ->
%  ok = foo(ok).
