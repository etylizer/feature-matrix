-module(poly_1).

-compile([export_all, nowarn_export_all]).

-spec foo(A) -> A.
foo(X) -> {X, X}.
