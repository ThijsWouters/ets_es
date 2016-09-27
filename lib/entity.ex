defmodule Entity do
  def new(name) do
    id = UUID.uuid4
    :ets.insert(:entity, {id, name})
    id
  end

  def add(entity, component, data) do
    id = UUID.uuid4
    :ets.insert(:entity_components, {component, entity, id})
    table = Component.table(component)
    :ets.insert(table, {id, data})
    entity
  end
end
