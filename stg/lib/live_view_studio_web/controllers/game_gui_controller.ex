defmodule LiveViewStudioWeb.GameGuiController do
  use LiveViewStudioWeb, :controller

  def new_game(conn, _params) do
    render(conn, "new_game.html")
  end

  def create_game(conn, _params) do
    render(conn, "create_game.html")
  end

  def create_game_input(conn, params) do
    input = params["create_game_input"]
    IO.inspect input["turns"]
    render(conn, "create_game.html")
  end

end
