-module(andalso_1).

-compile(export_all).
-compile(nowarn_export_all).

 -spec f1() -> boolean(). 
 f1() -> 
   ((true andalso g1()) andalso false).
  
 -spec g1() -> integer(). 
 g1() -> 2.
