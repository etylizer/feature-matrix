-module(exhaust_2).
-compile(export_all).
-compile(nowarn_export_all).

-spec f(integer(), atom()) -> ok.
f(X, Y) ->
    case {X, Y} of
        {Z, Z} -> ok
    end.
