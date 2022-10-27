-module(integer_04_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec integer_04_fail() -> 42.
integer_04_fail() -> foobar.

