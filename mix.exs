defmodule RSS.Mixfile do
  use Mix.Project

  def project do
    [app: :rss,
     version: "0.1.0",
     elixir: "~> 0.14.3",
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
      links: %{ "Github" => "https://github.com/bennyhallett/elixir-rss" }
    }
  end
end
