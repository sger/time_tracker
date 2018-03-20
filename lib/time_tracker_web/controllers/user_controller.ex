defmodule TimeTrackerWeb.UserController do
  use TimeTrackerWeb, :controller

  alias TimeTracker.Api
  alias TimeTracker.Api.User

  plug Guardian.Plug.EnsureAuthenticated, handler: Kokyu.SessionController

  def show(conn, _) do
    user = Guardian.Plug.current_resource(conn)

    conn
    |> put_status(:ok)
    |> render("show.json", user: user)
  end
end
