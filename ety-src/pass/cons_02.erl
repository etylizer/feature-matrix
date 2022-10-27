-module(cons_02).
-compile(export_all).
-compile(nowarn_export_all).




-spec cons_02() -> list(any()).
cons_02() -> [1 | ["foo" | []]].

