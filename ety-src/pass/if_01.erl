-module(if_01).
-compile(export_all).
-compile(nowarn_export_all).




-spec if_01(integer()) -> integer().
if_01(X) -> if X =:= 0 -> 42; true -> 0 end.

