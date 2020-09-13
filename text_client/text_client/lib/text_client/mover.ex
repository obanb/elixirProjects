defmodule TextClient.Mover do
  alias TextClient.State

  def make_move(game) do
  {game_service, tally} = Hangman2.make_move(game.game_service, game.guess )
  %State{ game | game_service: game_service, tally: tally}
  end
end
