defmodule Phitter.Router do
  use Phitter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Phitter do
    pipe_through :browser # Use the default browser stack
    get "/registration", RegistrationController, :new
    post "/registration", RegistrationController, :create
    
    get "/", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete

    get "/pheets", PheetController, :index
    get "/pheet", PheetController, :new
    post "/createpheet", PheetController, :create

    get "/pages", PageController, :index
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", Phitter do
  #   pipe_through :api
  # end
end
