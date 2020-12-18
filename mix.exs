defmodule Secret.MixProject do
  use Mix.Project

  def project do
    [
      app: :secret,
      version: "0.2.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "sugar for simple_secrets_ex to pack/unpack with signing secret from env",
      package: package()
    ]
  end

  def application do
    [ extra_applications: [:logger] ]
  end

  defp deps do
    [
      # {:simple_secrets, "~> 1.0"},
      {:simple_secrets, git: "https://github.com/camshaft/simple_secrets_ex.git", ref: "c9f6d4f990f33b37539e2519e5b497b446210ace"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE),
      maintainers: ["Brandon Bassett"],
      licenses: ["Apache 2.0"],
      links: %{
        "Github" => "http://github.com/struttura/secret"
      }
    ]
  end
end
