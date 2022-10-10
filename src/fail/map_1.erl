-module(map_1).
-compile(export_all).
-compile(nowarn_export_all).

-type map_sum_t() :: #{field_one := _}
                   | #{field_two := _}.

% missing field field_two 
-spec map_variants(map_sum_t()) -> ok.
map_variants(T) ->
    case T of
        #{field_one := _} -> ok
    end.
