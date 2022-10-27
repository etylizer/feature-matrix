-module(if_02).
-compile(export_all).
-compile(nowarn_export_all).




-spec if_02(integer()) -> integer() | string().
if_02(X) -> if X =:= 0 -> 42; true -> "foo" end.

