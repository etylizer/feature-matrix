-module(filtermap).
-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

% dialyzer ignores overlapping domains and throws and error, we don't want that
-dialyzer(no_contracts).
-spec my_filtermap(fun((T) -> boolean()), [T]) -> [T]
                ; (fun((T) -> {true, U} | false), [T]) -> [U]
                ; (fun((T) -> {true, U} | boolean()), [T]) -> [T | U].
my_filtermap(_F, []) -> [];
my_filtermap(F, [X|XS]) ->
    case F(X) of
        false -> my_filtermap(F, XS);
        true -> [X | my_filtermap(F, XS)];
        {true, Y} -> [Y | my_filtermap(F, XS)]
    end.

my_test() ->
    [2, 4] = my_filtermap(fun (X) -> X rem 2 == 0 end, [1,2,3,4]),
    [4, 8] = my_filtermap(fun (X) ->
        if X rem 2 == 0 -> {true, X*2};
           true -> false
        end end, [1,2,3,4]).
