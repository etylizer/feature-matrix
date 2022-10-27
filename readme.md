# Capability Test Suite

This repository contains tests measuring the capabilities of Erlang tools that use the Erlang type specification to find type errors.

The tools currently included are:

* Dialyzer
* Gradualizer
* Etylizer

The test suites currently included are:

* Gradualizer
* Etylizer


Roadmap:

* [ ] Eqwalizer
* [ ] Eqwalizer test cases

# Result Meaning

* `[O]`: Test case has expected result; 
  * test with type error detects the type error (exit code 1; error code 2 for dialyzer)
  * test without type error detects nothing (exit code 0)
* `[X]`: Test case has unexpected result; 
  * test with type error detects no type error (exit code 0)
  * test without type error detects a type error (exit code 1; error code 2 for dialyzer)
* `[M]`: Test case crashed; Memory (code 137)
* `[T]`: Test case crashed; Time (code 124)
* `[!]`: Unknown error code (code ?)



# Setup

The benchmark assumes the following:

* The Dialyzer plt has been built with `dialyzer --build_plt --apps erts kernel stdlib mnesia`

# Limitations

The test suite is currently run with the following limitations

* memory limit of 1Gb (enforced with `systemd-run`)
* time limit of 10s per module (enforced with `timeout`)

# Problems

* Dialyzer complains about ignoring overlapping domains and ignores them.
  This causes an exit code 2 error; Dialyzer did not detect the
  error, but we count those test cases as `passed`. Disabling contracts causes
  dialyzer to ignore all contracts, not only those with overlapping domains. We
  would need a flag that stops emitting warnings (code 2) if dialyzer did
  **not** do or check something, like ignoring overlapping domains.


# Interesting discussions

* https://github.com/josefs/Gradualizer/issues/433
* https://github.com/josefs/Gradualizer/issues/405
* https://github.com/erlang/otp/issues/6333
* ... todo many threads
