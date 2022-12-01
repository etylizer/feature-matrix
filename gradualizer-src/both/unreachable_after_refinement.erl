-module(unreachable_after_refinement).

-export([unreachable/1]).

% this is a compiler warning
-spec unreachable(a|b) -> ok.
unreachable(a) -> ok;
unreachable(b) -> ok;
unreachable(a) -> ok. %% <-- shouldn't happen....
