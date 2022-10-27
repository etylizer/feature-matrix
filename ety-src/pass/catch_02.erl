-module(catch_02).
-compile(export_all).
-compile(nowarn_export_all).




-spec catch_02() -> integer().
catch_02() -> X = catch (2/10), case X of Y when is_float(Y) -> floor(Y); _ -> 42 end.

