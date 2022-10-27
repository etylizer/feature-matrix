-module(case_05_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_05_fail(atom()) -> foobar.
case_05_fail(X) -> case X of spam -> X; _ -> foobar end.

