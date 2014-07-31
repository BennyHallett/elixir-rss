defmodule RSSTest do
  use ExUnit.Case

  test "build and item definition" do
    title = "Cats love lasers"
    link = "http://mycatblog/cats-love-lasers"
    guid = "http://mycatblog/cats-love-lasers"
    desc = "Combining the awesomeness of cats and lasers"
    pubDate = "Mon, 12 Sep 2005 18:37:00 GMT"

    assert RSS.item(title, desc, pubDate, link, guid) == """
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
