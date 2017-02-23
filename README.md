elixir-rss
==========

Simple RSS feed builder for Elixir

[![Build Status](https://travis-ci.org/BennyHallett/elixir-rss.svg?branch=master)](https://travis-ci.org/BennyHallett/elixir-rss)
[![Package](http://img.shields.io/hexpm/v/rss.svg)](https://hex.pm/packages/rss)

## Installing

To add `rss` to your mix project dependencies just edit your `mix.exs`

```elixir
defp deps do
  [ # your other dependencies (hint: mind the commas)
   { :rss, "~> 0.2.1" }
  ]
end
```

and to download and compile it run:

```shell
mix do deps.get, compile
```

## Usage

RSS provides 3 simple functions for building RSS feeds

To create the channel section, use [`RSS.channel/5`](https://github.com/BennyHallett/elixir-rss/blob/master/lib/rss.ex#L25-L33)

```elixir
<<<<<<< HEAD
<<<<<<< HEAD
channel = RSS.channel(
  "Title",
  "http://link.to.site",
  "Description",
  "Date in RFC 882 format",
  "en-us" # Or any other valid ISO-639 language code
)
=======
channel = RSS.channel("Title", "http://link.to.site", "Description", "Date in RFC 1123 or RFC 882 format", "en-us")
>>>>>>> Minor fixes
=======
channel = RSS.channel("Title", "http://link.to.site", "Description", "Date in RFC 1123 or RFC 882 format", "en-us")
>>>>>>> origin/cdata-lang-and-version
```

You only need to do this once. From here on in, you can create items using [`RSS.item/5`](https://github.com/BennyHallett/elixir-rss/blob/master/lib/rss.ex#L13-L23).

```elixir
<<<<<<< HEAD
<<<<<<< HEAD
item = RSS.item(
  "Title",
  "Description",
  "Date in RFC 882 format",
  "http://link.to.site/post", # Link to the item
  "http://link.to.site/post" # Permalink, that uniquely identifies the item (can be the same as link above)
)
=======
item = RSS.item("Title", "Description", "Date in RFC 1123 or RFC 882 format", "http://link.to.site/post", "guid-1234-aa"
>>>>>>> Minor fixes
=======
item = RSS.item("Title", "Description", "Date in RFC 1123 or RFC 882 format", "http://link.to.site/post", "guid-1234-aa"
>>>>>>> origin/cdata-lang-and-version
```

Once you have a list of items, in a variable names `items` perhaps, you can build the full feed by using [`RSS.feed/2`](https://github.com/BennyHallett/elixir-rss/blob/master/lib/rss.ex#L3-L11)

```elixir
feed = RSS.feed(channel, items)
```

## Links

Research for the feed format came from [this blog post](http://www.petefreitag.com/item/465.cfm)

Validate your RSS using the [W3C feed validator](https://validator.w3.org/feed/)
