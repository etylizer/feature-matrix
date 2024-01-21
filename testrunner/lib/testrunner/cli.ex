defmodule Testrunner.Cli do
  def main(_args \\ []) do
    args = System.argv()

    {named_opts_raw, _other_opts, _errors} = OptionParser.parse(args,
      strict: [suites: :string, categories: :string, disable_parallelism: :boolean, timeout_executable: :string, test: :boolean],
      aliases: [s: :suites, c: :categories, d: :disable_parallelism, t: :timeout_executable])
    named_opts = Map.new(named_opts_raw)

    test_suites = String.split(Map.get(named_opts, :suites, "../ety-src,../gradualizer-src"), ",")
    test_categories = String.split(Map.get(named_opts, :categories, ""), ",", trim: true)
    disable_parallelism = Map.get(named_opts, :disable_parallelism, false)
    timeout_executable = Map.get(named_opts, :timeout_executable, Path.absname("./timeout"))
    IO.puts("Using '#{timeout_executable}' as timeout executable.")

    test_mode = Map.get(named_opts, :test, false)

    if disable_parallelism do
      IO.puts("Parallelism disabled. Execution time can increase significantly!")
    end

    test_data = TestCollector.collect_tests(test_suites, test_categories)

#    Use different paths for development
    executables = case test_mode do
      true ->
        [
          {:dialyzer, "dialyzer"},
          {:etylizer, "../ety"},
          {:gradualizer, "../gradualizer"}
        ]
      false ->
        [
          {:dialyzer, "dialyzer"},
          {:etylizer, "./ety"},
          {:gradualizer, "./gradualizer"}
        ]
    end

    test_results = Enum.map(executables, fn executable = {exec_type, _} ->
        IO.inspect({:executable, exec_type})
        %{executable: exec_type, test_suites: TestRunner.run_tests(executable, test_data, disable_parallelism, timeout_executable)}
    end)

    json = Jason.encode!(test_results, [pretty: true])
    File.write("test_results.json", json)
  end
end
