-module(tuple_02_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec tuple_02_fail() -> {integer(), string()}.
tuple_02_fail() -> {"foo", 42}.

