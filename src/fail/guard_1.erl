-module(guard_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec wrong_arity(fun((any()) -> any()) | other) -> fun((any()) -> any()) | not_function.
wrong_arity(F) when is_function(F, 2) -> F;
wrong_arity(_) -> not_function.
