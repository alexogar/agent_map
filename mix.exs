defmodule MultiAgent.Mixfile do
  use Mix.Project

  def project do
    [
      app: :multi_agent,
      version: "0.1.0",
      elixir: "~> 1.6.0-rc",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:earmark, "~> 1.1", only: :dev},
     {:ex_doc, "~> 0.16", only: :dev}]
  end
end
