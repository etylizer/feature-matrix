defmodule TestRunner do
  @type test_result() :: :pass | :fail | :not_implemented | :timeout | :crash_memory | :unknown
  @type file_result() :: %{file: String.t(), result: test_result(), raw_result: test_result(), expected_result: test_result(), time: integer()}
  @type category_result() :: %{category: String.t(), actual_time: integer(), total_time: integer(), results: [file_result()]}
  @type suite_result() :: %{test_suite: String.t(), categories: [category_result()]}

  @spec run_tests({atom(), String.t()}, [TestCollector.test_suite()], boolean(), String.t()) :: [suite_result()]
  def run_tests(executable, tests, disable_parallelism, timeout_executable) do
    Enum.map(tests, fn test_suite = %{suite: suite_name} ->
      %{test_suite: suite_name, categories: run_suite_tests(executable, test_suite, disable_parallelism, timeout_executable)}
    end)
#    |> Map.new(fn %{test_suite: test_suite, results: results} -> {test_suite, results} end)
  end

  @spec run_suite_tests({atom(), String.t()}, TestCollector.test_suite(), boolean(), String.t()) :: [category_result()]
  defp run_suite_tests(executable, %{suite: suite_name, test_categories: test_categories}, disable_parallelism, timeout_executable) do
    IO.inspect({:suite, suite_name})

    Enum.map(test_categories, fn test_category ->
      run_category_tests(executable, test_category, disable_parallelism, timeout_executable)
    end)
#    |> Map.new(fn %{category: category, results: results} -> {category, results} end)
  end

  @spec run_category_tests({atom(), String.t()}, TestCollector.test_category(), boolean(), String.t()) :: category_result()
  defp run_category_tests(executable, %{
         category: category_name,
         expected_result: expected_result,
         files: files
       }, disable_parallelism, timeout_executable) do
    IO.inspect({:category, category_name})

    category_start_time = :os.system_time(:millisecond)
    results = case disable_parallelism do
      true ->
        Enum.map(files, fn test_file -> process_test_file(test_file, executable, expected_result, timeout_executable) end)
      false ->
        Flow.from_enumerable(files, min_demand: 1, max_demand: 2)
        |> Flow.map(fn test_file -> process_test_file(test_file, executable, expected_result, timeout_executable) end)
        |> Enum.to_list()
    end

    category_end_time = :os.system_time(:millisecond)
    total_time = Enum.reduce(results, 0, fn %{time: time}, sum -> sum + time end)
    actual_time = category_end_time - category_start_time
    %{category: category_name, results: results, actual_time: actual_time, total_time: total_time}
  end

  @spec process_test_file(String.t(), {atom(), String.t()}, atom(), String.t()) :: file_result()
  defp process_test_file(test_file, executable, expected_result, timeout_executable) do
    %{raw_result: raw_result, result: test_result, time_diff: time_diff} = run_test(executable, expected_result, test_file, timeout_executable)
    IO.inspect({test_file, test_result})
    %{file: test_file, time: time_diff, result: test_result, raw_result: raw_result, expected_result: expected_result}
  end

  @spec run_test({atom(), String.t()}, atom(), String.t(), String.t()) :: %{raw_result: test_result(), result: test_result(), time_diff: integer()}
  defp run_test(executable, expected_result, test_file, timeout_executable) do
    args = build_args(executable, test_file)
    start_time = :os.system_time(:millisecond)
    {_output, exit_code} = System.cmd(timeout_executable, ["-t", "10", "-s", "6000000" | args], stderr_to_stdout: true)
    end_time = :os.system_time(:millisecond)
    time_diff = end_time - start_time
    Map.put(evaluate_result(exit_code, expected_result, executable), :time_diff, time_diff)
  end

  @spec build_args({atom(), String.t()}, String.t()) :: [String.t()]
  defp build_args({type, path}, test_file) do
    case type do
      :dialyzer -> [path, "--src", test_file]
      _ -> [path, test_file]
    end
  end

  @spec evaluate_result(integer(), atom(), {atom(), String.t()}) :: %{raw_result: test_result(), result: test_result()}
  defp evaluate_result(exit_code, expected_result, executable) do
    raw_result = evaluate_raw_result(exit_code, executable)

    result = case raw_result do
      :pass when expected_result == :pass -> :pass
      :pass when expected_result == :fail -> :fail
      :fail when expected_result == :pass -> :fail
      :fail when expected_result == :fail -> :pass
      :pass when expected_result == :both -> :pass
      :fail when expected_result == :both -> :pass
      _ -> raw_result
    end

    %{raw_result: raw_result, result: result}
  end

  @spec evaluate_raw_result(integer(), {atom(), String.t()}) :: test_result()
  defp evaluate_raw_result(exit_code, {executable_type, _}) do
    effective_exit_code =
      case exit_code do
        1 when executable_type == :dialyzer -> 2
        2 when executable_type == :dialyzer -> 1
        _ -> exit_code
      end

    case effective_exit_code do
      0 -> :pass
      1 -> :fail
      2 -> :fail
      5 -> :not_implemented
      124 -> :timeout
      137 -> :crash_memory
      _ -> :unknown
    end
  end
end
