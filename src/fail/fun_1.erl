-module(fun_1).
-compile(export_all).
-compile(nowarn_export_all).

% from gradualizer known problems

-spec f(list()) -> list().
f(Int) ->
    F = fun(I) -> integer_to_list(I) end,
    F(Int).
