-module(fun_local_01).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_local_01() -> integer().
fun_local_01() -> F = fun(X, Y) -> X + Y end, F(1, 2).

