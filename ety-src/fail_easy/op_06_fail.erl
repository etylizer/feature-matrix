-module(op_06_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec op_06_fail(integer()) -> boolean().
op_06_fail(X) -> X + "foo".

