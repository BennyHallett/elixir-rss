elixir-rss
==========

Simple RSS feed builder for Elixir

[![Build Status](https://travis-ci.org/BennyHallett/elixir-rss.svg?branch=master)](https://travis-ci.org/BennyHallett/elixir-rss)
[![Package](http://img.shields.io/hexpm/v/rss.svg)](https://hex.pm/packages/rss)

## NOTE

We're undergoing some changes to the RSS library at the moment, including actually supporting the RSS2 spec and adding parsing and validating.

As such, the `master` branch may be unstable for a week or so.

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
channel = RSS.channel("Title", "http://link.to.site", "Description", "Date in RFC 1123 or RFC 882 format", "en-us")
```

You only need to do this once. From here on in, you can create items using [`RSS.item/5`](https://github.com/BennyHallett/elixir-rss/blob/master/lib/rss.ex#L13-L23).

```elixir
item = RSS.item("Title", "Description", "Date in RFC 1123 or RFC 882 format", "http://link.to.site/post", "guid-1234-aa"
```

Once you have a list of items, in a variable names `items` perhaps, you can build the full feed by using [`RSS.feed/2`](https://github.com/BennyHallett/elixir-rss/blob/master/lib/rss.ex#L3-L11)

```elixir
feed = RSS.feed(channel, items)
```

## Master Branch Usage

The changes in the `master` branch significantly alter how RSS is generated using this library.

```elixir
channel = RSS.Channel.new(title: "A good blog")
item = RSS.Item.new(title: "A good post")
feed = RSS.Feed.new(channel: channel, items: [item])
RSS.generate(feed)
```

Note that the above RSS won't be 100% valid (required fields are missing) - I kept it small for example purposes. The validation coming soon will ensure that the document is valid before generating it.

The module doc for `RSS.Channel` and `RSS.Item` explain the full list of available fields.

## Links

Research for the feed format came from [this blog post](http://www.petefreitag.com/item/465.cfm)

Validate your RSS using the [W3C feed validator](https://validator.w3.org/feed/)
