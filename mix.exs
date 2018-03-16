defmodule AgentMap.Mixfile do
  use Mix.Project

  def project do
    [
      app: :agent_map,
      version: "0.9.9",
      elixir: "~> 1.6.0",
      start_permanent: Mix.env() == :prod,
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
    [
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.18", only: :dev},
      {:credo, "~> 0.8.10", only: :dev}
    ]
  end
end
