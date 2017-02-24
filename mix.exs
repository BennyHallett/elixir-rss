defmodule RSS.Mixfile do
  use Mix.Project

  def project do
    [app: :rss,
     version: "0.2.1",
     elixir: "~> 1.4",
     package: package(),
     docs: [readme: true, main: "README.md"],
     description: """
     A super simple RSS feed builder
     """,
     deps: deps()]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      {:xml_builder, "~> 0.0.9"},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      contributors: ["Benny Hallett"],
      links: %{ "Github" => "https://github.com/bennyhallett/elixir-rss" }
    }
  end
end
