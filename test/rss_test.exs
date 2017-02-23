defmodule RSSTest do
  use ExUnit.Case

  test "build an item definition" do
    title = "Cats love lasers"
    link = "http://mycatblog/cats-love-lasers"
    guid = "http://mycatblog/cats-love-lasers"
    desc = "Combining the awesomeness of cats and lasers"
    pubDate = "Mon, 12 Sep 2005 18:37:00 GMT"

    assert RSS.item(title, desc, pubDate, link, guid) == """
    <item>
      <title>#{title}</title>
      <description><![CDATA[#{desc}]]></description>
      <pubDate>#{pubDate}</pubDate>
      <link>#{link}</link>
      <guid>#{guid}</guid>
    </item>
    """
  end

  test "build a channel definition" do
    title = "Good Cat Blog"
    link = "http://goodcats.bestblog.com/"
    desc = "A blog about cats"
    date = "Mon, 12 Sep 2005 18:37:00 GMT"
    lang = "en-us"

    assert RSS.channel(title, link, desc, date, lang) == """
      <title>#{title}</title>
      <link>#{link}</link>
      <description>#{desc}</description>
      <lastBuildDate>#{date}</lastBuildDate>
      <language>#{lang}</language>
    """
  end

  test "build feed" do
    channel = RSS.channel("Test blog", "http://test.blog", "This is a test blog", "Mon, 12 Sep 2005 18:37:00 GMT", "en-us")
    item2 = RSS.item("Post 2", "The second post", "Mon, 12 Sep 2005 18:37:00 GMT", "http://test.blog/two", "http://test.blog/two")
    item1 = RSS.item("Post 1", "The first post", "Sun, 11 Sep 2005 18:37:00 GMT", "http://test.blog/one", "http://test.blog/one")

    assert RSS.feed(channel, [item2, item1]) == """
    <?xml version="1.0" encoding="utf-8"?>
    <rss version="2.0">
    <channel>
      <title>Test blog</title>
      <link>http://test.blog</link>
      <description>This is a test blog</description>
      <lastBuildDate>Mon, 12 Sep 2005 18:37:00 GMT</lastBuildDate>
      <language>en-us</language>
    <item>
      <title>Post 2</title>
      <description><![CDATA[The second post]]></description>
      <pubDate>Mon, 12 Sep 2005 18:37:00 GMT</pubDate>
      <link>http://test.blog/two</link>
      <guid>http://test.blog/two</guid>
    </item>
    <item>
      <title>Post 1</title>
      <description><![CDATA[The first post]]></description>
      <pubDate>Sun, 11 Sep 2005 18:37:00 GMT</pubDate>
      <link>http://test.blog/one</link>
      <guid>http://test.blog/one</guid>
    </item>
    </channel>
    </rss>
    """
  end
end
