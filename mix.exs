defmodule Elixirtemplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixirtemplate,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison, :poison],
      mod: {Elixirtemplate.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.1"},
      {:poison, "~> 4.0"},
      {:uuid, "~> 1.1"},
      {:httpoison, "~> 1.5"}
    ]
  end
end
