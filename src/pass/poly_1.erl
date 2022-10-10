-module(poly_1).

-export([duffyId/1]).

% From "Polymorphic functions with set-theoretic types (Part 1)"
-spec duffyId(T) -> T.
duffyId(X) -> (fun (_Y) -> X end)(X).

