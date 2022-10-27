-module(case_04).
-compile(export_all).
-compile(nowarn_export_all).




-spec case_04(atom()) -> foobar.
case_04(X) -> case X of foobar -> X; _ -> foobar end.

