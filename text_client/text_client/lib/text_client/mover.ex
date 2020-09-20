defmodule TextClient.Mover do
  alias TextClient.State

  def make_move(game) do
    tally = Hangman2.make_move(game.game_service, game.guess )
    %State{ game | tally: tally}
  end
end
