defmodule BmxWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :bmx_web,
      version: "0.0.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {BmxWeb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # ----- phoenix backend
      {:phoenix, "~> 1.4.4"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_html, "~> 2.11"},
      {:plug_cowboy, "~> 2.0"},
      # ----- phoenix view helpers 
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view"},
      {:phoenix_active_link, "~> 0.2.1"},
      {:gettext, "~> 0.11"},
      # ----- util
      {:jason, "~> 1.0"},
      {:timex, "~> 3.1"},
      # ----- data-access components
      # {:bmx01, in_umbrella: true},
      # ----- development and test
      {:phoenix_live_reload, "~> 1.2", only: :dev}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, we extend the test task to create and migrate the database.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
  end
end
