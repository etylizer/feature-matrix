-module(rec_1).
-compile(export_all).
-compile(nowarn_export_all).


-type box(T) :: T | integer().

-type listof(T) :: nil | {cons, T, listof(T)}.

-spec rec_bound(T) -> integer() when
    T :: listof(T).
rec_bound(_X) -> 0.

-spec multi_rec_bounds(T, U) -> integer() when
    T :: listof(U),
    U :: box(T).
multi_rec_bounds(_X, _Y) -> 0.
