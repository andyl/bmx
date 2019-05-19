defmodule Bmx.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  #
  # hex - {:mydep, "~> 0.3.0"}
  # git - {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  defp deps do
    [{:mix_test_watch, "~> 0.8", only: :dev, runtime: false}]
  end
end
