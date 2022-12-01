-module(type_variable).

-compile([export_all, nowarn_export_all]).

-spec fff() -> Result when Result :: integer().
fff() -> 0.

%% Result should be pos_integer() in the end.
-spec ff() -> Result when
    Result       :: integer() | Intermediate,
    Result       :: apple | Other,
    Intermediate :: boolean() | Other,
    Other        :: pos_integer().
ff() -> 1.
