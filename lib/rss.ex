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

end
