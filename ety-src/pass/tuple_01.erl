-module(tuple_01).
-compile(export_all).
-compile(nowarn_export_all).




-spec tuple_01() -> {integer(), string()}.
tuple_01() -> {42, "foo"}.

