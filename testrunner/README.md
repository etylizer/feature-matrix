# Testrunner

An elixir application used to run various erlang type checkers on a set of tests.

## Requirements

- Elixir 1.15.0 or higher
- A linux system where the custom `timeout` command is available (needs to support `-t` and `-s` flags for time and
  memory limits)
    - Windows is not supported out of the box, however, if you can provide a windows-compatible `timeout` executable, it
      should work

## Build and Run

To build the project and generate an executable, run:

```bash
mix escript.build
```

For development, use:

```bash
mix run mix run -e Testrunner.Cli.main -- --suites <test-suite-paths>
```

The test suite paths should be relative to the current working directory. Multiple test suites can be separated by a
comma.

## Usage

### Test file structure

All test files need to be structured in test suites and category following this schema:

```
test-suite-name
├── category-1
    ├── test-file-1.erl
    ├── test-file-2.erl
    └── ...
├── category-2
    ├── test-file-1.erl
    ├── test-file-2.erl
    └── ...
```

Category names need to start with the expected result. They can contain any suffix as long as it is separated from the
expected result with an underscore.
Valid expected results are:

- `pass`
- `fail`
- `both`
- `unknown`

Any other expected result will be mapped to `unknown`.

### Command line options

There are multiple command line options to customize the behaviour of the test runner:

- `--suites <test-suite-paths>` | `-s <test-suite-paths>`: The test suite paths should be relative to the current
  working directory. Multiple test suites can be separated by a comma.
- `--categories <categories>` | `-c <categories>`: The categories to run. Multiple categories can be separated by a
  comma. If no categories are specified, all categories will be run. **Needs at least one test suite to be specified**
- `--disable-parallellism` | `-d`: Disables parallellism. This will run all tests sequentially.
- `--timeout-executable <path>` | `-t <path>`: The path to the `timeout` executable. Defaults to a `timeout` executable
  in the current working directory.

The timeout executable is used to limit both memory usage and runtime of the tested analyzer executables.
