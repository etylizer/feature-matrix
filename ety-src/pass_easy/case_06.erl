-module(case_06).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_06(any()) -> integer().
case_06(X) -> case X of Y when is_integer(Y) -> Y; _ -> 42 end.

