defmodule RSS do

  @moduledoc """
  RSS v2.0 Feed Generation Library

  Based on specification at: https://validator.w3.org/feed/docs/rss2.html
  """

  def feed(channel, items) do
    """
    <?xml version="1.0" encoding="utf-8"?>
    <rss version="2.0">
    <channel>
    #{channel}#{Enum.join items, ""}</channel>
    </rss>
    """
  end

  def item(title, desc, pubDate, link, guid) do
    """
    <item>
      <title>#{title}</title>
      <description><![CDATA[#{desc}]]></description>
      <pubDate>#{pubDate}</pubDate>
      <link>#{link}</link>
      <guid>#{guid}</guid>
    </item>
    """
  end

  def channel(title, link, desc, date, lang) do
    """
      <title>#{title}</title>
      <link>#{link}</link>
      <description>#{desc}</description>
      <lastBuildDate>#{date}</lastBuildDate>
      <language>#{lang}</language>
    """
  end

end
