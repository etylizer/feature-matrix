-module(tuple_03).
-compile(export_all).
-compile(nowarn_export_all).




-spec tuple_03() -> {atom(), integer(), {boolean(), string()}}.
tuple_03() -> {foo, 42, {true, "foo"}}.

