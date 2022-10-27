-module(fun_ref_03_fail).
-compile(export_all).
-compile(nowarn_export_all).

% fun ref and call
-spec some_fun(string(), integer()) -> string().
some_fun(S, _) -> S.

-spec fun_ref_03_fail() -> string().
fun_ref_03_fail() -> some_fun("foo", "42").

