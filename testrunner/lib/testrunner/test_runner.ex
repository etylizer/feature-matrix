defmodule TestRunner do
  @spec run_tests({atom(), String.t()}, [TestCollector.test_suite()]) :: any()
  def run_tests(executable, tests) do
    Enum.map(tests, fn test_suite ->
      run_suite_tests(executable, test_suite)
    end)
  end

  @spec run_suite_tests({atom(), String.t()}, TestCollector.test_suite()) :: any()
  defp run_suite_tests(executable, %{suite: suite_name, test_categories: test_categories}) do
    IO.inspect({:suite, suite_name})

    Enum.each(test_categories, fn test_category ->
      run_category_tests(executable, test_category)
    end)
  end

  @spec run_category_tests({atom(), String.t()}, TestCollector.test_category()) :: any()
  defp run_category_tests(executable, %{
         category: category_name,
         expected_result: expected_result,
         files: files
       }) do
    IO.inspect({:category, category_name})

    Enum.each(files, fn test_file ->
      result = run_test(executable, expected_result, test_file)
      IO.inspect({test_file, result})
      result
    end)
  end

  defp run_test(executable, expected_result, test_file) do
    proc = spawn_process(executable, test_file)
    result = Porcelain.Process.await(proc, 10_000)

    case result do
      {:ok, result} ->
        evaluate_result(result, expected_result, executable)

      {:error, :timeout} ->
        IO.puts("Timeout: #{test_file}")
        Porcelain.Process.stop(proc)
        :timeout

      {:error, _} ->
        IO.puts("Unspecified process error: #{test_file}")
        :error
    end
  end

  defp spawn_process({type, path}, test_file) do
    case type do
      :dialyzer -> Porcelain.spawn(path, ["--src", test_file])
      _ -> Porcelain.spawn(path, [test_file])
    end
  end

  defp evaluate_result(
         result = %Porcelain.Result{status: status},
         expected_result,
         {executable_type, _}
       ) do
    effective_status =
      case status do
        1 when executable_type == :dialyzer -> 2
        2 when executable_type == :dialyzer -> 1
        _ -> status
      end

    case effective_status do
      0 when expected_result == :pass -> :pass
      0 when expected_result == :fail -> :fail
      1 when expected_result == :pass -> :fail
      1 when expected_result == :fail -> :pass
      2 when expected_result == :pass -> :fail
      2 when expected_result == :fail -> :pass
      0 when expected_result == :both -> :pass
      1 when expected_result == :both -> :pass
      5 -> :not_implemented
      137 -> :crash_memory
      _ -> :unknown
    end
  end
end
