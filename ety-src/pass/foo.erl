-module(foo).
-compile(export_all).
-compile(nowarn_export_all).




-spec foo([T]) -> [T].
foo(L) -> case L of [] -> []; [_X|XS] -> XS end.

