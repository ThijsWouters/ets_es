defmodule Data do
  def get(component, id) do
    :ets.lookup(Component.table(component), id)
    |> Enum.at(0)
  end

  def update(component, id, data) do
    :ets.insert(Component.table(component), {id, data})
  end
end
