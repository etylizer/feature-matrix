-module(typecase_fail).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

% dialyzer ignores overlapping domains and throws and error, we don't want that
-dialyzer(no_contracts).
-spec foo(number()) -> number(); (string()) -> string().
foo(X) when is_integer(X) -> "foo";
foo(X) -> string:length(X).
