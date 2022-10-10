-module(andalso_1).

-compile(export_all).
-compile(nowarn_export_all).

 -spec f1() -> boolean(). 
 f1() -> 
   % precise (shortcut behavior)
   % andalso :: (false, _ -> false); (true, T) -> T)
   (true andalso g1()).


% X, Y
% case X of
%   true -> Y
%   false -> false
  
 -spec g1() -> any(). 
 g1() -> 3.
