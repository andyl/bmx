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

    live "/demo", Home.DemoLive
  end

  scope "/admin", BmxWeb do
    pipe_through :browser

    get "/",          AdminController, :index
    # get "/users",     AdminController, :users
    get "/offers",    AdminController, :offers
    get "/contracts", AdminController, :contracts

    live "/users", Admin.UsersLive
  end

  scope "/admin_gq", BmxWeb do
    pipe_through :browser

    get "/",      AdminGqController, :index
    get "/urls",  AdminGqController, :urls
    get "/logs",  AdminGqController, :logs
    get "/stats", AdminGqController, :stats
  end
end
