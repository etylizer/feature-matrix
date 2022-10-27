-module(fun_03).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_03(string(), integer()) -> integer().
fun_03(_X, Y) -> Y.

