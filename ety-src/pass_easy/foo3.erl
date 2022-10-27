-module(foo3).
-compile(export_all).
-compile(nowarn_export_all).





-spec foo3(a|b) -> 1|true.
foo3(a) -> 1; foo3(b) -> true.

