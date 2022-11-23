-module(block_01).
-compile(export_all).
-compile(nowarn_export_all).



% exhaustiveness + constant propagation
-spec block_01() -> integer().
block_01() -> X = 1 + 3, case X of 4 -> 5; _ -> 42 end.

