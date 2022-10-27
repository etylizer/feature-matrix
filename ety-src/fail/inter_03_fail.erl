-module(inter_03_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec inter_03_fail(integer()) -> integer() ; (atom()) -> atom().
inter_03_fail(X) -> case X of _ when is_integer(X) -> X + 1; _ -> X + 2 end.

