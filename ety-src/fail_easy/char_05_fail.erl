-module(char_05_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec char_05_fail() -> $a.
char_05_fail() -> foobar.

