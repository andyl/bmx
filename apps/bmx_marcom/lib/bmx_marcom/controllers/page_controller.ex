defmodule BmxMarcom.PageController do
  use BmxMarcom, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
