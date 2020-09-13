defmodule TextClient.Summary do
  def display(game = %{ tally: tally}) do
      IO.puts [
        "\n",
        "word so far: #{Enum.join(tally.letters, "")} \n",
        "Guesses left: #{tally.turns_left} \n"
      ]
      game
  end
end
