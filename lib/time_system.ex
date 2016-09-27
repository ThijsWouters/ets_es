defmodule TimeSystem do
  def process do
    Component.data("age")
    |> Enum.map(fn data_id ->
      Data.get("age", data_id)
    end)
    |> Enum.each(fn {data_id, [age: age]} ->
      Data.update("age", data_id, [age: age + 1])
    end)
  end
end
