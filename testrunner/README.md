# Testrunner

An elixir application used to run various erlang type checkers on a set of tests.

## Requirements

- Elixir 1.15.0 or higher
- A linux system where the `timeout` command is available
  - Windows is not supported out of the box, however, if you can provide a windows-compatible `timeout` command, it should work

## Build and Run

To build the project and generate an executable, run:
```bash
mix escript.build
```

For development, use:
```bash
mix run mix run -e Testrunner.Cli.main -- --suites <test-suite-paths>
```

The test suite paths should be relative to the current working directory. Multiple test suites can be separated by a space.
