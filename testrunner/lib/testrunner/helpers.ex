defmodule Helpers do
  @spec get_category(String.t) :: atom()
  def get_category(category_string) do
    case category_string do
      "fail" <> _ -> :fail
      "pass" <> _ -> :pass
      "unknown" -> :unknown
      "both" -> :both
      _ -> :unknown
    end
  end
end
