-module(if_04_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec if_04_fail(atom()) -> integer().
if_04_fail(X) -> if (X + 1) =:= 0 -> 0; true -> 1 end.

