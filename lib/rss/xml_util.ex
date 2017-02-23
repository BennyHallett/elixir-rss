defmodule RSS.XmlUtil do

  def prepare(name, element) do
    children = element
    |> Map.to_list
    |> Enum.reject(fn {_k, v} -> is_nil(v) end)
    |> Enum.reject(fn {k, _v} -> k == :__struct__ end)
    |> Enum.map(fn {k, v} ->
      {to_string(k), %{}, v}
    end)
    |> camel_case_keys
    {name, %{}, children}
  end

  def generate(element), do: XmlBuilder.generate(element)

  defp camel_case_keys(elements) do
    Enum.map(elements, fn {name, attr, value} ->
      {camel_case_key(name), attr, value}
    end)
  end

  defp camel_case_key(key), do: _camel_case_key(String.codepoints(key), "")

  defp _camel_case_key([], result), do: result
  defp _camel_case_key(["_", char|tail], result), do: _camel_case_key(tail, result <> String.upcase(char))
  defp _camel_case_key([char | tail], result), do: _camel_case_key(tail, result <> char)

end
