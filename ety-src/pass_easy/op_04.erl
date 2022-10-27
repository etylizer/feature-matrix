-module(op_04).
-compile(export_all).
-compile(nowarn_export_all).




-spec op_04() -> list(integer()).
op_04() -> [1,2] ++ [3,4].

