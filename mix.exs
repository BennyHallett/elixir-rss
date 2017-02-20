defmodule RSS.Mixfile do
  use Mix.Project

  def project do
    [app: :rss,
     version: "0.2.1",
     elixir: "~> 1.2",
     package: package,
     docs: [readme: true, main: "README.md"],
     description: """
     A super simple RSS feed builder
     """,
     deps: deps]
  end

  def application do
    [applications: []]
  end

  defp deps do
    []
  end

  defp package do
    %{
      licenses: ["MIT"],
      contributors: ["Benny Hallett"],
      links: %{ "Github" => "https://github.com/bennyhallett/elixir-rss" }
    }
  end
end
