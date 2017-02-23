defmodule RSS do
  alias RSS.XmlUtil

  @moduledoc """
  RSS v2.0 Feed Generation Library

  Based on specification at: https://validator.w3.org/feed/docs/rss2.html
  """
  def generate(feed) do
    {:rss, %{version: "2.0"}, inner_content(feed)}
    |> XmlUtil.generate
    |> prepend_xml_header
  end

  defp inner_content(feed) do
    [
      generate_channel(feed.channel),
      generate_items(feed.items)
    ]
  end

  defp generate_channel(channel), do: XmlUtil.prepare(:channel, channel)

  defp generate_items(items), do: Enum.map(items, fn i -> XmlUtil.prepare(:item, i) end)

  @xml_header ~s|<?xml version="1.0" encoding="utf-8"?>|

  defp prepend_xml_header(content), do: @xml_header <> "\n" <> content

end
