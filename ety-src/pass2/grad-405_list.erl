-module(hlist).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("eunit/include/eunit.hrl").

% https://github.com/josefs/Gradualizer/issues/405

-spec i([atom()]) -> ok.
i([]) -> ok;
i([Cs]) -> ok;
i([C1, C2 | Cs]) -> ok.
