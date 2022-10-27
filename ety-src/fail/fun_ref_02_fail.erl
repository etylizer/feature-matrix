-module(fun_ref_02_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_ref_02_fail() -> integer().
fun_ref_02_fail() -> some_fun("foo", 42).

