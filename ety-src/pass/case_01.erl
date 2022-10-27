-module(case_01).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_01(atom()) -> foobar.
case_01(X) -> case X of spam -> foobar; _ -> foobar end.

