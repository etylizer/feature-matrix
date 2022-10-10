-module(list_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec lists_any(fun((T) -> boolean()), [T]) -> boolean().
lists_any(Pred, [X|Xs]) -> Pred(X) orelse lists_any(Pred, Xs);
lists_any(_Pred, [])    -> false.
