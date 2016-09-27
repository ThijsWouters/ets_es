defmodule DrawSystem do
  def process do
    Component.data("age")
    |> Enum.map(fn data_id ->
      Data.get("age", data_id)
    end)
    |> Enum.each(fn {_, [age: age]} ->
      IO.puts(age)
    end)
  end
end
