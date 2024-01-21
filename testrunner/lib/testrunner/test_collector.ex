defmodule TestCollector do
  @type test_category() :: %{category: String.t(), expected_result: atom(), files: [String.t()]}
  @type test_suite() :: %{suite: String.t(), test_categories: [test_category()]}

  @spec collect_tests([String.t()], [String.t()]) :: test_suite()
  def collect_tests(test_suites, test_categories) do
    Enum.map(test_suites, fn suite ->
      %{suite: suite, test_categories: collect_suite_tests(suite, test_categories)}
    end)
  end

  @spec collect_suite_tests(String.t(), [String.t()]) :: [test_category()]
  defp collect_suite_tests(suite_name, categories) do
    test_categories = Path.wildcard("#{suite_name}/*")

    Enum.map(test_categories, fn test_category ->
      test_files = Path.wildcard("#{test_category}/*.erl")
      category_name = List.last(Path.split(test_category))

      %{
        category: category_name,
        expected_result: Helpers.get_category(List.last(Path.split(test_category))),
        files: test_files,
      }
    end)
      |> Enum.filter(fn %{category: category_name} -> Enum.empty?(categories) || Enum.member?(categories, category_name) end)
  end
end
