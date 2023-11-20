defmodule Dictionary do

  alias Dictionary.Impl.WordList

  defdelegate start, to: WordList

  defdelegate random_word, to: WordList

end
