defmodule AgentMap.Bench do
  def ets(range) do
    table = :ets.new(:test, [:protected, :set])
    agent = AgentMap.new()
    map = Enum.reduce range, %{}, fn x, acc ->
      Map.put(acc, x, x)
    end

    for k <- range, v <- range do
      :ets.insert(table, {k, v})
      AgentMap.put(agent, k, v)
    end

    f = fn ->
      for k <- range do
        :ets.lookup(table, k)
      end
    end

    ag = fn ->
      for k <- range do
        AgentMap.get(agent, k)
      end
    end

    mp = fn ->
      for k <- range do
        Map.get(map, k)
      end
    end

    m..n = range

    Benchee.run(%{
      "ets read #{n - m + 1}" => f,
      "agentmap read #{n - m + 1}" => ag,
      "map read #{n - m + 1}" => mp
    },
    formatters: [
      {Benchee.Formatters.HTML, file: "output/singlethread.html", auto_open: false},
      Benchee.Formatters.Console
    ])

    Benchee.run(%{
      "ets read #{n - m + 1}, p=2" => f,
      "agentmap read #{n - m + 1}, p=2" => ag,
      "map read #{n - m + 1}, p=2" => mp
    }, parallel: 2,
    formatters: [
      {Benchee.Formatters.HTML, file: "output/2.html", auto_open: false},
      Benchee.Formatters.Console
    ])

    Benchee.run(%{
      "ets read #{n - m + 1}, p=3" => f,
      "agentmap read #{n - m + 1}" => ag,
      "map read #{n - m + 1}, p=3" => mp
    }, parallel: 2,
    formatters: [
      {Benchee.Formatters.HTML, file: "output/3.html", auto_open: false},
      Benchee.Formatters.Console
    ])
  end
end
