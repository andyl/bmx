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
      docs: docs(),
      releases: releases()
    ]
  end

  defp deps do
    [
      # ----- deployment
      {:distillery, "~> 2.1"},
      # ----- monitoring and tracing
      {:recon_ex, "~> 0.9"},
      # ----- static analyzers
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      # ----- development and testing
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:ex_guard, "~> 1.3", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      logo: ["assets/bugmark_logo.png"],
      assets: "assets",
      extra_section: "GUIDES",
      extras: [
        "README.md",
        "guides/intro.md"
      ]
    ]
  end

  defp releases do
    [
      base: [
        applications: [bmx01: :permanent, bmx_web: :permanent],
        version: "0.0.1"
      ],
      all: [
        applications: [bmx_web: :permanent],
        version: "0.0.1"
      ],
      bmx01: [
        applications: [bmx01: :permanent]
      ],
      bmx01_web: [
        applications: [bmx01_web: :permanent]
      ]
    ]
  end
end
