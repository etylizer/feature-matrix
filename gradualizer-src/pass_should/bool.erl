-module(bool).

-compile([export_all, nowarn_export_all]).

%% variable bindings should propagate from first to second arg of orelse
-spec b() -> boolean().
b() ->
    begin
        A = 1,
        is_integer(A)
    end
        orelse
        is_float(A).

