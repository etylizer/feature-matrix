-module(exhaust_1).
-compile(export_all).
-compile(nowarn_export_all).

% from gradualizer known problems

-type t() :: ala | ola.

-spec f(t(), any()) -> ok.
f(ala, _) -> ok.
