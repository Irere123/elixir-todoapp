defmodule Todoapp.MixProject do
  use Mix.Project

  def project do
    [
      app: :todoapp,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Todoapp, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.3"},
      {:mongodb_driver, "~> 0.8"},
      {:absinthe, "~> 1.6"},
      {:absinthe_plug, "~> 1.5"},
      {:remix, "~> 0.0.1", only: :dev}
    ]
  end
end
