defmodule DrawSystem do
  def process do
    Component.data(["age", "name"])
    |> Enum.each(fn {_, %{"age" => {_, [age: age]}, "name" => {_, name}}} ->
      IO.puts "#{name} is #{age}"
    end)
  end
end
