-module(intersection_1).

-export([plus/2]).

-spec plus(integer(), integer()) -> integer();
           (integer(), float()) -> float();
           (float(), integer()) -> float();
           (float(), float()) -> float().
plus(X, Y) -> (X + ok).

