-module(cons_05).
-compile(export_all).
-compile(nowarn_export_all).




-spec cons_05() -> list().
cons_05() -> [1 | [2 | []]].

