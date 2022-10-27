-module(fun_ref_03_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec fun_ref_03_fail() -> string().
fun_ref_03_fail() -> some_fun("foo", "42").

