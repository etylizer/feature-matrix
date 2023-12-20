defmodule Testrunner.Cli do
  def main(_args \\ []) do
    args = System.argv()
    test_suites = case args do
      ["--suites" | test_suites] -> test_suites
      _ -> ["../ety-src", "../gradualizer-src"] # default values for testing
    end

    test_data = TestCollector.collect_tests(test_suites)

    executables = [
      {:dialyzer, "dialyzer"},
      {:etylizer, "../ety"},
      {:gradualizer, "../gradualizer"}
    ]

    test_results = Enum.map(executables, fn executable = {exec_type, _} ->
        IO.inspect({:executable, exec_type})
        %{executable: exec_type, test_suites: TestRunner.run_tests(executable, test_data)}
    end)

    json = Jason.encode!(test_results, [pretty: true])
    File.write("test_results.json", json)
  end
end
