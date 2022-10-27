-module(op_08).
-compile(export_all).
-compile(nowarn_export_all).




-spec op_08() -> list().
op_08() -> [1,2] ++ ["foo", "bar"].

