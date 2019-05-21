defmodule Bmx.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "BMX",
      source_url: "https://github.com/andyl/bmx",
      homepage_url: "https://bugmark.net",
      docs: docs()
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:distillery, "~> 2.0"},
      {:ex_guard, "~> 1.3", only: :dev}
    ]
  end

  defp docs do
    [
      logo: ["img/bugmark_logo.png"],
      extras: ["README.md"]
    ]
  end
end
