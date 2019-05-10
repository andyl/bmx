defmodule BmxWeb.PageController do
  use BmxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
