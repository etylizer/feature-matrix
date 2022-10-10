-module(arith_1).
-compile(export_all).
-compile(nowarn_export_all).

% from gradualizer known problems

-spec int_error(any(), float()) -> integer().
int_error(X, Y) ->
    A = X div Y,
    A.
