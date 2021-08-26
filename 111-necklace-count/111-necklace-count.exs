defmodule NecklaceCount do
  def main do
    all_data = IO.read(:stdio, :all)
    try do
      get_data(all_data)
        |> Enum.map(&count_distinct_ways(&1))
        |> Enum.map(&IO.write("#{&1} "))
    rescue
      _ -> IO.puts("Unexpected entry")
    end
  end

  def get_data(all_data) do
    String.split(all_data, "\n")
    |> Enum.reject(fn item -> item == "" end)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&to_int/1)
    |> tl()
  end

  def to_int(list) do
    Enum.map(list, &String.to_integer/1)
  end

  def iterator(colors, beads, count, answer) do
    if count < beads do
      aux = Integer.gcd(count, beads)
      iterator(colors, beads, count + 1, answer + :math.pow(colors, aux))
    else
      answer
    end
  end

  def count_distinct_ways([colors, beads]) do
    aux = Kernel.round(iterator(colors, beads, 0, 0))
    div(aux, beads)
  end

end

NecklaceCount.main()