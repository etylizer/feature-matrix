-module(typed_record_field_access).

-compile([export_all, nowarn_export_all]).

-record(r, {a, b}).

-type r() :: #r{a :: integer()}.

-spec b(r()) -> any().
b(R) ->
    R#r.b.
