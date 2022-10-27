-module(case_02_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_02_fail(atom()) -> foobar.
case_02_fail(X) -> case X of spam -> foobar; Y -> Y end.

