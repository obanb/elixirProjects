defmodule TextClient.Player do
  alias TextClient.{State, Summary, Prompter, Mover}

  # won, lost, good guess, bad guess, already used, initialising
  def play(%State{tally: %{ game_state: :won}}) do
    "You won"
    |> exit_with_message
  end

  def play(%State{tally: %{ game_state: :lost}}) do
    "You lost"
    |> exit_with_message
  end

  def play(game = %State{tally: %{ game_state: :good_guess}}) do
    game
    |> continue_with_message("good guess")
  end

  def play(game = %State{tally: %{ game_state: :bad_guess}}) do
    game
    |> continue_with_message("sorry bad guess")
  end

  def play(game = %State{tally: %{ game_state: :allready_used}}) do
    game
    |> continue_with_message("sorry allready_used")
  end

  def play(game) do
    continue(game)
  end

  def continue(game) do
    game
    |> Summary.display
    |> Prompter.accept_move
    |> Mover.make_move
    |> play
  end

  def continue_with_message(game, msg) do
    IO.puts(msg)
    continue(game)
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end

end