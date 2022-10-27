-module(tuple_05_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec tuple_05_fail({atom(), integer()}) -> integer().
tuple_05_fail(X) -> case X of {A, _} -> A end.

