# Capability Test Suite

This repository contains tests measuring the capabilities of Erlang tools that use the Erlang type specification to find type errors.

The tools currently included are:

* Dialyzer
* Gradualizer
* Eqwalizer
* Etylizer


# Setup

The benchmark assumes the following:

* The Dialyzer plt has been built with `dialyzer --build_plt --apps erts kernel stdlib mnesia`

# Limitations

The test suite is currently run with the following limitations

* memory limit of 1Gb (enforced with `systemd-run`)
* time limit of 10s per module (enforced with `timeout`)

# Resources

* Some test cases are from the Gradualizer test suite


# Interesting discussions

* https://github.com/josefs/Gradualizer/issues/433
* https://github.com/josefs/Gradualizer/issues/405
* https://github.com/erlang/otp/issues/6333
