-module(fun_02_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_02_fail(integer()) -> atom().
fun_02_fail(X) -> X.

