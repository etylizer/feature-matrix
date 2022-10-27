-module(case_03_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_03_fail(atom()) -> foobar.
case_03_fail(X) -> case X of spam -> egg; _ -> foobar end.

