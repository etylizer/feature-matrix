-module(named_1).
-compile(export_all).
-compile(nowarn_export_all).


-type box(T) :: T | integer().

-spec foo(T) -> integer() when
    T :: a | b | c,
    T :: a | c.
foo(_X) -> 1.

-spec bar(box(Receive)) -> string() when
    Receive :: a | b.
bar(_X) -> "foo".

-spec with_length([T]) -> [{integer(), T}] when
    T :: [any()].
with_length([]) -> [];
with_length([X | Xs]) ->
    [{length(X), X} | with_length(Xs)].
