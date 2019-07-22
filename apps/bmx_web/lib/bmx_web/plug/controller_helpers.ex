defmodule BmxWeb.Plug.ControllerHelpers do
  @doc """
  Create subnav assign

  The subnav partial is assumed to live in the `templates/layout` directory.
  """
  def assign_subnav(conn, str) do
    Plug.Conn.assign(conn, :subnav, "_#{str}_subnav.html")
  end
end
