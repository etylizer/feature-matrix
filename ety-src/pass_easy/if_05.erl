-module(if_05).
-compile(export_all).
-compile(nowarn_export_all).




-spec if_05(atom()) -> integer().
if_05(X) -> if X =:= 0 -> 0; true -> 1 end.

