-module(case_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec var_as_pattern(atom()) -> integer().
var_as_pattern(Atom) ->
    case get_any() of
        % binding of atom of line 6 should be intersected
        % with return type of get_any()
        Atom -> Atom;
        {Atom} -> Atom
    end.

-spec get_any() -> any().
get_any() ->
    receive Any -> Any end.
