-module(catch_03_fail).
-compile(export_all).
-compile(nowarn_export_all).




-spec catch_03_fail() -> float().
catch_03_fail() -> catch (1/10) + 1.

