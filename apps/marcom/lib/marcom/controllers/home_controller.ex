defmodule Marcom.HomeController do
  use Marcom, :controller

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

  def resources(conn, _params) do
    render(conn, "resources.html")
  end

  def architecture(conn, _params) do
    render(conn, "architecture.html")
  end

  def roadmap(conn, _params) do
    render(conn, "roadmap.html")
  end
end
