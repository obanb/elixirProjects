defmodule Core.Game do
  alias __MODULE__

  defstruct [
    number_of_players: 0,
    state: :initializing,
    board_size_x: 10,
    board_size_y: 10,
    player1: %{
      position_x: 0,
      position_y: 0
    },
    player2: %{
      position_x: 0,
      position_y: 0
    }
  ]

  def get_state do
    %Game{}.state
  end

  def move(player, to) do

  end

end