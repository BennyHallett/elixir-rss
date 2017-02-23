defmodule RSSTest do
  use ExUnit.Case

  test "build feed" do
    item1 = RSS.Item.new title: "Post 1", description: "The first post", pub_date: "Sun, 11 Sep 2005 18:37:00 GMT", link: "https://test.blog/one", guid: "https://test.blog/one"
    item2 = RSS.Item.new title: "Post 2", description: "The second post", pub_date: "Mon, 12 Sep 2005 18:37:00 GMT", link: "https://test.blog/one", guid: "https://test.blog/one"
    channel = RSS.Channel.new title: "Test blog", link: "https://test.blog", description: "This is a test blog", last_build_date: "Mon, 12 Sep 2005 18:37:00 GMT", language: "en-us"
    feed = RSS.Feed.new channel: channel, items: [item2, item1]

    assert RSS.generate(feed) ==
~s|<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
\t<channel>
\t\t<description>This is a test blog</description>
\t\t<language>en-us</language>
\t\t<lastBuildDate>Mon, 12 Sep 2005 18:37:00 GMT</lastBuildDate>
\t\t<link>https://test.blog</link>
\t\t<title>Test blog</title>
\t</channel>
\t<item>
\t\t<description><![CDATA[The second post]]></description>
\t\t<guid>https://test.blog/two</guid>
\t\t<link>https://test.blog/two</link>
\t\t<pubDate>Mon, 12 Sep 2005 18:37:00 GMT</pubDate>
\t\t<title>Post 2</title>
\t</item>
\t<item>
\t\t<description><![CDATA[The first post]]></description>
\t\t<guid>https://test.blog/one</guid>
\t\t<link>https://test.blog/one</link>
\t\t<pubDate>Sun, 11 Sep 2005 18:37:00 GMT</pubDate>
\t\t<title>Post 1</title>
\t</item>
</rss>|
  end
end
