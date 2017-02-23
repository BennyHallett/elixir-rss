defmodule RSS.XmlUtil do

  def prepare(element) do
    element
    |> Map.to_list
    |> Enum.reject(fn {_k, v} -> is_nil(v) end)
    |> Enum.reject(fn {k, _v} -> k == :__struct__ end)
    |> Enum.map(fn {k, v} ->
      {k, %{}, v}
    end)
  end

  def generate(name, element = {_name, _attr, _val}), do: XmlBuilder.generate({name, %{}, element})
  def generate(name, element), do: XmlBuilder.generate({name, %{}, prepare(element)})

end
