defmodule LiveViewStudioWeb.GameGuiView do
  use LiveViewStudioWeb, :view

  def new_game_button(conn) do
    button("New Game", to: Routes.game_gui_path(conn, :create_game), class: "btn")
  end

end
