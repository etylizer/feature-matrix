-module(fun_local_05_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_local_05_fail(integer()) -> integer().
fun_local_05_fail(X) -> F = fun(Y) -> X + Y end, F("foo").

