-module(improper_list_1).
-compile(export_all).
-compile(nowarn_export_all).

-spec atom_tail() -> maybe_improper_list(integer(), atom()).
atom_tail() ->
    [ 1 | banana ].
