defmodule Testrunner.Cli do
  def main(args \\ []) do
#    test_data = TestCollector.collect_tests(["ety-src", "gradualizer-src"])
    test_data = TestCollector.collect_tests(["../ety-src", "../gradualizer-src"])
#    IO.inspect(test_data)
    TestRunner.run_tests({:dialyzer, "./dialyzer"}, test_data)
    TestRunner.run_tests({:etylizer, "./ety"}, test_data)
  end
end
