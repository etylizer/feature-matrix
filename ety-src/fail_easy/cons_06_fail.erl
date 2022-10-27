-module(cons_06_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec cons_06_fail() -> [].
cons_06_fail() -> [1 | [2 | []]].

