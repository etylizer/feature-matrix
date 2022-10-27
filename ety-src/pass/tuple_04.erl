-module(tuple_04).
-compile(export_all).
-compile(nowarn_export_all).




-spec tuple_04({atom(), integer()}) -> integer().
tuple_04(X) -> case X of {_, I} -> I end.

