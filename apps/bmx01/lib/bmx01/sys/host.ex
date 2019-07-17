defmodule Bmx01.Sys.Host do
  def name do
    System.get_env("SYSNAME")
  end

  def reset do
    reset_postgres()
  end

  def seed do
  end

  defp reset_postgres do
  end
end
