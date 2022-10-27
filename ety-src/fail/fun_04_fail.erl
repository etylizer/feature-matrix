-module(fun_04_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_04_fail(string(), integer()) -> integer().
fun_04_fail(X, _Y) -> X.

