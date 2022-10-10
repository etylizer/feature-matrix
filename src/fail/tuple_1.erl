-module(tuple_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec pat_any(any()) -> float().
pat_any({S = "string"}) -> S;
pat_any({"prefix" ++ L}) -> L.
