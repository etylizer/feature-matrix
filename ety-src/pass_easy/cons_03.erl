-module(cons_03).
-compile(export_all).
-compile(nowarn_export_all).




-spec cons_03() -> list(string() | integer()).
cons_03() -> [1 | ["foo" | []]].

