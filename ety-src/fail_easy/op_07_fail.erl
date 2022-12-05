-module(op_07_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec op_07_fail() -> list(integer()).
op_07_fail() -> [1,2] ++ ["foo", "bar"].



% crashing test case
%-spec sum(list(integer())) -> integer().
%sum([]) -> 0;
%sum([H | T]) -> sum(T) + H.
%
%-spec g() -> integer().
%g() ->
%  sum(op_07_fail()).
