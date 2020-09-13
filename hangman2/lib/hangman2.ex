defmodule Hangman2 do

  alias Hangman2.Game
  defdelegate new_game(), to: Game
  defdelegate tally(game), to: Game

  def make_move(game, guess) do
    game = Game.make_move(game, guess)
    { game, tally(game)}
  end

end