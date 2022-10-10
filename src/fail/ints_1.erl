-module(ints_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec arg1() -> non_neg_integer().
arg1() ->
  % here we trust the type spec of `-`
    0 - 0.

-spec arg2() -> non_neg_integer().
arg2() ->
    3 - 2.
