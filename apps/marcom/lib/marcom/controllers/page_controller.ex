defmodule Marcom.PageController do
  use Marcom, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
