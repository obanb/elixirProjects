defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert length(game.letters) > 0
  end

  test "state isnt changed for :won or :lost game" do
    for state <- [:won, :lost] do
      game = Game.new_game()
             |> Map.put(:game_state, state)

      assert ^game = Game.make_move(game, "x")
    end
  end

  test "first occurrence is not already used " do
    game = Game.new_game()

    game = Game.make_move(game, "x");
    assert game.game_state != :already_used
  end

  test "second occurrence is not already used " do
    game = Game.new_game()

    game = Game.make_move(game, "x");
    assert game.game_state != :already_used

    game = Game.make_move(game, "x");
    assert game.game_state == :already_used
  end

  test "test good guess recognized" do
    game = Game.new_game("wibble")

    game = Game.make_move(game, "w");
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "test guessed word won game" do
    game = Game.new_game("wibble")

    game = Game.make_move(game, "w");
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Game.make_move(game, "i");
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Game.make_move(game, "b");
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Game.make_move(game, "l");
    assert game.game_state == :good_guess
    assert game.turns_left == 7
    game = Game.make_move(game, "e");
    assert game.game_state == :won
    assert game.turns_left == 7
  end

  test "test bad guess" do
    game = Game.new_game("wibble")
    game = Game.make_move(game, "x");
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end

  test "game lost" do
    game = Game.new_game("w")
    game = Game.make_move(game, "a");
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
    game = Game.make_move(game, "b");
    assert game.game_state == :bad_guess
    assert game.turns_left == 5
    game = Game.make_move(game, "c");
    assert game.game_state == :bad_guess
    assert game.turns_left == 4
    game = Game.make_move(game, "d");
    assert game.game_state == :bad_guess
    assert game.turns_left == 3
    game = Game.make_move(game, "e");
    assert game.game_state == :bad_guess
    assert game.turns_left == 2
    game = Game.make_move(game, "f");
    assert game.game_state == :bad_guess
    assert game.turns_left == 1
    game = Game.make_move(game, "g");
    assert game.game_state == :lost
  end

end
