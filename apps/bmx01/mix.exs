defmodule Bmx01.MixProject do
  use Mix.Project

  def project do
    [
      app: :bmx01,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Bmx01.Application, []},
      # appliations: [:ex_machina],
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # DATABASE
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:pg_ranges, "~> 0.1.0"},
      # CQRS
      # {:commanded, "~> 0.18"},
      # {:eventstore, "~> 0.16"},
      # {:commanded_ecto_projections, "~> 0.8"},
      # {:commanded_eventstore_adapter, "~> 0.5"},
      # UTIL
      {:jason, "~> 1.1"},
      {:telemetry, "~> 0.3"},
      # TESTING
      {:ex_machina, "~> 2.3"},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:propcheck, "~> 1.1", only: [:test, :dev]}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
