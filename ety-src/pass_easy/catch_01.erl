-module(catch_01).
-compile(export_all).
-compile(nowarn_export_all).




-spec catch_01() -> any().
catch_01() -> catch (2/10).

