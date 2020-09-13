defmodule Dictionary do

  alias Dictionary.Wordlist

  defdelegate start(), to: Wordlist, as: :word_list
  defdelegate random_word(word_list), to: Wordlist

end
