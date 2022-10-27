-module(fun_ref_02_fail).
-compile(export_all).
-compile(nowarn_export_all).

% fun ref and call
-spec some_fun(string(), integer()) -> string().
some_fun(S, _) -> S.

-spec fun_ref_02_fail() -> integer().
fun_ref_02_fail() -> some_fun("foo", 42).

