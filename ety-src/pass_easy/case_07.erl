-module(case_07).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_07(any()) -> integer().
case_07(X) -> case X of _ when is_integer(X) -> X; _ -> 42 end.

