-module(case_08_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_08_fail(any(), any()) -> integer().
case_08_fail(X, Z) -> case Z of _ when is_integer(X) -> Z; _ -> 42 end.

