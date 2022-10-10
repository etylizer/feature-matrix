-module(poly_2).

-compile([export_all, nowarn_export_all]).

-spec p(A, A) -> A.
p(A, B) -> A + B.

-spec test() -> integer().
test() ->
    p(1, 3.2).
