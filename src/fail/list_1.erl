-module(list_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec lists_any(fun((T) -> boolean()), [T]) -> boolean().
% should be Pred(X) and any(Pred, Xs)
% Xs :: [T]
% Pred takes T as argument, Pred(Xs) ty_error
% lists_any similar
lists_any(Pred, [X|Xs]) -> Pred(Xs) orelse lists_any(Pred, X);
lists_any(_Pred, [])    -> false.
