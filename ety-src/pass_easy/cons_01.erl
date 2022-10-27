-module(cons_01).
-compile(export_all).
-compile(nowarn_export_all).




-spec cons_01() -> list(integer()).
cons_01() -> [1 | [2 | []]].

