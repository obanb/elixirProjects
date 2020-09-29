defmodule Core.Game do
  alias __MODULE__

  defstruct [
    number_of_players: 0,
    state: :initializing,
    board_size_x: 10,
    board_size_y: 10
  ]

  def get_state do
    %Game{}.state
  end

end