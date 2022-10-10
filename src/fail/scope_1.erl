-module(scope_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec var_as_pattern(atom()) -> integer().
var_as_pattern(Atom) ->
    case get_any() of
        Atom ->
	          %% at this point Atom :: any()
	          %% but we want Atom :: atom() & any()
            Atom;
        {Atom} ->
            %% same as above
            Atom
    end.

-spec get_any() -> any().
get_any() ->
    receive Any -> Any end.
