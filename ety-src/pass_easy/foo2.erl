-module(foo2).
-compile(export_all).
-compile(nowarn_export_all).




-spec foo2 (a) -> 1; (b) -> 2.
foo2(a) -> 1; foo2(b) -> 2.

