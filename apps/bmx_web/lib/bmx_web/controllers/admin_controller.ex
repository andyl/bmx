defmodule BmxWeb.AdminController do
  use BmxWeb, :controller

  plug :assign_subnav, "admin"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def users(conn, _params) do
    render(conn, "users.html", users: Bmx01.Ctx.Account.all_users())
  end

  def offers(conn, _params) do
    render(conn, "offers.html")
  end

  def contracts(conn, _params) do
    render(conn, "contracts.html")
  end
end
