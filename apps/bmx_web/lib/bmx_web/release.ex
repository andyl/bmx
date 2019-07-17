defmodule BmxWeb.Release do
  def ecto_create do
    {:ok, _} = Application.ensure_all_started(:bmx01)
  end

  def ecto_migrate do
    
  end
end
