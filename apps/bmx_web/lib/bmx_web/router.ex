defmodule BmxWeb.Router do
  use BmxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BmxWeb do
    pipe_through :browser

    get "/",      HomeController, :index
    get "/urls",  HomeController, :urls
    get "/logs",  HomeController, :logs
    get "/stats", HomeController, :stats

    live "/demo", Demo
  end

  # Other scopes may use custom stacks.
  # scope "/api", BmxWeb do
  #   pipe_through :api
  # end
end
