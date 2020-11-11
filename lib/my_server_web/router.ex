defmodule MyServerWeb.Router do
  use MyServerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyServerWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :check
  end
end
