-module(inter_02).
-compile(export_all).
-compile(nowarn_export_all).

-spec use_atom(atom()) -> atom().
use_atom(X) -> X.

-spec inter_02(atom()) -> atom() ; (integer()) -> integer().
inter_02(X) -> case X of _ when is_integer(X) -> X + 1; _ -> use_atom(X) end.

