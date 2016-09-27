defmodule Component do
  def new(name, description) do
    :ets.insert(:component, {name, description, component_data_table})
  end

  def name(component) do
    component
  end

  def table(component) do
    get(component)
    |> elem(2)
  end

  defp get(component) do
    :ets.lookup(:component, component)
    |> Enum.at(0)
  end

  def data(components) when is_list(components) do
    components
    |> Enum.map(fn component ->
      :ets.lookup(:entity_components, component)
    end)
    |> List.flatten
    |> Enum.reduce(%{}, fn {component, entity, data}, acc ->
      map = Map.get(acc, entity, %{})
      Map.put(acc, entity, Map.put(map, component, Data.get(component, data)))
    end)
  end

  def data(component) do
    :ets.lookup(:entity_components, component)
    |> Enum.map(fn {_, _, data} ->
      data
    end)
  end

  defp component_data_table do
    :ets.new(:component_data, [:set, :protected])
  end
end
