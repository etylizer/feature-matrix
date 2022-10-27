-module(if_03_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec if_03_fail(integer()) -> integer().
if_03_fail(X) -> if X =:= 0 -> 42; true -> "foo" end.

