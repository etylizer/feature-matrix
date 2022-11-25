-module(unary_negate_union_with_user_type_pass).

-compile([export_all, nowarn_export_all]).

-type price() :: integer().

-spec price(_) -> float() | price().
price(_) -> 100.

-spec f(_, _) -> boolean().
f(G, ReversePaymentG) ->
    price(G) =:= - price(ReversePaymentG).
