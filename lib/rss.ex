defmodule RSS do

  def item(title, desc, pubDate, link, guid) do
    """
    <item>
      <title>#{title}</title>
      <description>[CDATA[ #{desc} ]]</description>
      <pubDate>#{pubDate}</pubDate>
      <link>#{link}</link>
      <guid>#{guid}</guid>
    </item>
    """
  end

  def channel(title, link, desc, date, lang) do
    """
    <channel>
      <title>#{title}</title>
      <link>#{link}</link>
      <description>#{desc}</description>
      <lastBuildDate>#{date}</lastBuildDate>
      <language>#{lang}</language>
    </channel>
    """
  end

end
