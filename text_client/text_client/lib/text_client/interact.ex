  defmodule TextClient.Interact do

  @hangman2_server :"hangman2@archie-Nitro-AN515-52"
  alias TextClient.{State, Player}

  def start() do
    new_game()
    |> setup_state
    |> Player.play()
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman2.tally(game),
    }
  end

  defp new_game() do
    Node.connect(@hangman2_server)
    :rpc.call(@hangman2_server, Hangman2, :new_game, [])
  end
end