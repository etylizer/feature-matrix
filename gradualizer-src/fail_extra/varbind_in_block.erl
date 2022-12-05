-module(varbind_in_block).

-export([add_vars/2]).

% should fail because input 1,3 crashes
-spec add_vars(1..2, 2..3) -> 2.
add_vars(A, B) ->
    V = A,
    V = B,
    V.
