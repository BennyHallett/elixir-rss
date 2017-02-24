defmodule RSS.XmlUtil do

  @moduledoc """
  Utility functions for converting `RSS` structs into xml
  """

  @spec prepare(String.t() | atom(), %RSS.Item{} | %RSS.Channel{}) :: {String.t() | atom(), %{}, list()}
  @doc """
  Convert `RSS.Item` and `RSS.Channel` into structures
  required by `generate/1`

  Arguments:
  * `name` - The name of the surrounding xml element
  * `element` - Either `RSS.Item` or `RSS.Channel`
  """
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

  @spec generate({String.t() | atom(), %{}, list()}) :: String.t()
  @doc """
  Generate xml given the structures provided in `prepare/2`

  Requires the structure outlined by `XmlBuilder`: https://github.com/joshnuss/xml_builder
  i.e: `{name, attrs, children}`
  """
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
