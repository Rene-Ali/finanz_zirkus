defmodule FinanzZirkusWeb.Router do
  use FinanzZirkusWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FinanzZirkusWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", FinanzZirkusWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end
end
