defmodule BmxWeb.AdminGqController do
  use BmxWeb, :controller

  plug :assign_subnav, "admin_gq"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def urls(conn, _params) do
    render(conn, "urls.html")
  end

  def logs(conn, _params) do
    render(conn, "logs.html")
  end

  def stats(conn, _params) do
    render(conn, "stats.html")
  end
end
