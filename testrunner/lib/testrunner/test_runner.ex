defmodule TestRunner do
  @type test_result() :: :pass | :fail | :not_implemented | :timeout | :crash_memory | :unknown
  @type file_result() :: %{file: String.t(), result: test_result()}
  @type category_result() :: %{category: String.t(), results: [file_result()]}
  @type suite_result() :: %{test_suite: String.t(), results: [category_result()]}

  @spec run_tests({atom(), String.t()}, [TestCollector.test_suite()]) :: [suite_result()]
  def run_tests(executable, tests) do
    Enum.map(tests, fn test_suite = %{suite: suite_name} ->
      %{test_suite: suite_name, results: run_suite_tests(executable, test_suite)}
    end)
#    |> Map.new(fn %{test_suite: test_suite, results: results} -> {test_suite, results} end)
  end

  @spec run_suite_tests({atom(), String.t()}, TestCollector.test_suite()) :: [category_result()]
  defp run_suite_tests(executable, %{suite: suite_name, test_categories: test_categories}) do
    IO.inspect({:suite, suite_name})

    Enum.map(test_categories, fn test_category ->
      run_category_tests(executable, test_category)
    end)
#    |> Map.new(fn %{category: category, results: results} -> {category, results} end)
  end

  @spec run_category_tests({atom(), String.t()}, TestCollector.test_category()) :: category_result()
  defp run_category_tests(executable, %{
         category: category_name,
         expected_result: expected_result,
         files: files
       }) do
    IO.inspect({:category, category_name})

    results = Flow.from_enumerable(files, min_demand: 1, max_demand: 2)
    |> Flow.map(fn test_file ->
      test_result = run_test(executable, expected_result, test_file)
      IO.inspect({test_file, test_result})
      %{file: test_file, result: test_result}
    end)
    |> Enum.to_list()

    %{category: category_name, results: results}
  end

  @spec run_test({atom(), String.t()}, atom(), String.t()) :: test_result()
  defp run_test(executable, expected_result, test_file) do
    args = build_args(executable, test_file)
    {_output, exit_code} = System.cmd("timeout", ["10" | args], stderr_to_stdout: true)
    evaluate_result(exit_code, expected_result, executable)
  end

  @spec build_args({atom(), String.t()}, String.t()) :: [String.t()]
  defp build_args({type, path}, test_file) do
    case type do
      :dialyzer -> [path, "--src", test_file]
      _ -> [path, test_file]
    end
  end

  @spec evaluate_result(integer(), atom(), {atom(), String.t()}) :: test_result()
  defp evaluate_result(exit_code, expected_result, {executable_type, _}) do
    effective_exit_code =
      case exit_code do
        1 when executable_type == :dialyzer -> 2
        2 when executable_type == :dialyzer -> 1
        _ -> exit_code
      end

    case effective_exit_code do
      0 when expected_result == :pass -> :pass
      0 when expected_result == :fail -> :fail
      1 when expected_result == :pass -> :fail
      1 when expected_result == :fail -> :pass
      2 when expected_result == :pass -> :fail
      2 when expected_result == :fail -> :pass
      0 when expected_result == :both -> :pass
      1 when expected_result == :both -> :pass
      5 -> :not_implemented
      124 -> :timeout
      137 -> :crash_memory
      _ -> :unknown
    end
  end
end
