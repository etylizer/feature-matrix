-module(any_1).
-compile(export_all).
-compile(nowarn_export_all).

 -spec f1() -> boolean(). 
 f1() -> 
   % andalso :: (boolean(), boolean()) -> boolean()
   % more precise (shortcut behavior)
   % andalso :: (false, _ -> false); (true, boolean()) -> boolean())
   % more precise (all cases)
   % andalso :: (false, _ -> false); (true, true) -> true); (true, false) -> false
   %
   % any() is not subtype of boolean()
   (true andalso g1()) andalso false. 

% X, Y
% case X of
%   true -> Y
%   false -> false
  
 -spec g1() -> any(). 
 g1() -> 3.
