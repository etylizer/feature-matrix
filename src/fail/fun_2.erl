-module(fun_2).
-compile(export_all).
-compile(nowarn_export_all).

-spec return_fun_no_spec() -> integer().
return_fun_no_spec() -> fun no_spec/0.

no_spec() -> ok.
