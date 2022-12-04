-module(typecase).

-compile(export_all).
-compile(nowarn_export_all).

-spec foo_infer(integer() | string()) -> integer() | string().
foo_infer(X) when is_integer(X) -> X + 1;
foo_infer(X) -> X ++ "_abc".

-spec foo(integer()) -> integer(); (string()) -> string().
foo(X) when is_integer(X) -> X + 1;
foo(X) -> X ++ "_abc".
