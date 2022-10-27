-module(cons_04_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec cons_04_fail() -> list(integer()).
cons_04_fail() -> [1 | [2 | 3]].

