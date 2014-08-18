elixir-rss
==========

Simple RSS feed builder for Elixir

[![Build Status](https://travis-ci.org/BennyHallett/elixir-rss.svg?branch=master)](https://travis-ci.org/BennyHallett/elixir-rss)

## Installing

Add `rss` to your mix project dependencies

    defp deps do
      [{ :rss, "~> 0.1.0" }]
    end

and download/compile it

    $ mix deps.get
    $ mix deps.compile

## Usage

RSS provides 3 simple functions for building RSS feeds

To create the channel section, use `RSS.channel/5`

    $ channel = RSS.channel("Title", "http://link.to.site", "Description", "Date in RFC 882 format", "lang (en-us)")

You only need to do this once. From here on in, you can create items using `RSS.item/5`.

    $ item = RSS.item("Title", "Description", "Date in RFC 882 format", "http://link.to.site/post", "guid-1234-aa"

Once you have a list of items, in a variable names `items` perhaps, you can build the full feed by using `RSS.feed/2`

    $ feed = RSS.feed(channel, items)

## Links

Research for the feed format came from [this blog post](http://www.petefreitag.com/item/465.cfm)
