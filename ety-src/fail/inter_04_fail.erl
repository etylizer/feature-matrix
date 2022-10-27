-module(inter_04_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec inter_04_fail
  ([T]) -> [T]; 
  ([T]) -> [T].
inter_04_fail(L) -> 
  case L of 
    [] -> []; 
    [_X | XS] -> XS + 1 % ERROR ignored if branch ignored when type-checking 
  end.

