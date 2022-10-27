-module(op_07_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec op_07_fail() -> list(integer()).
op_07_fail() -> [1,2] ++ ["foo", "bar"].

