-module(ints_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec arg1() -> non_neg_integer().
arg1() ->
  % question: should this really pass?
  % here we trust the type spec of `-`
  % even though we could make the type spec of `-` more precise
  % for some edge cases (e.g. X - 0 -> X when X :: integer() && ...), it's not worth it
  % type spec of Erlang allows for type level calculations though...
  % maybe constant folding/partial evaluation?
  0 - 0.

-spec arg2() -> non_neg_integer().
arg2() ->
    3 - 2.
