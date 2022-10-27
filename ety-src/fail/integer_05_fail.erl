-module(integer_05_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec integer_05_fail() -> integer().
integer_05_fail() -> foobar.

