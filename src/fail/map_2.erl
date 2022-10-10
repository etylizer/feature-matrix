-module(map_2).
-compile(export_all).
-compile(nowarn_export_all).

-type map_sum_t() :: #{field_one := _}
                   | #{field_two := _}.

% bad map return
-spec map_variants(map_sum_t()) -> ok.
map_variants(T) ->
    case T of
        #{field_one := _} -> ok;
        #{field_two := _} -> wrong
    end.
