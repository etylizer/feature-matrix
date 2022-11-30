-module(t).

-export([g/1]).

-spec g([tag]) -> [string()];
       (tag) -> string().
g([] = _Types) -> [];
g([_|_] = Types) -> lists:map(fun g/1, Types);
g(tag) -> "".


% > g([])
% []
%
% > g(tag)
% "" equiv []
%
% > g([tag, tag])
% ["", ""] equiv [[], []]
%
