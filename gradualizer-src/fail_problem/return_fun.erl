-module(return_fun).

-compile([export_all, nowarn_export_all]).

%% By default inferring type from expressions with no spec is disabled.
%% So the type of `fun no_spec/0' is `any()' which is a subtype of
%% `integer()'
-spec return_fun_no_spec() -> integer().
return_fun_no_spec() -> fun no_spec/0.

no_spec() -> ok.
