defmodule Hangman do

  alias Hangman.Type
  alias Hangman.Impl.Game

  @opaque game :: Game.t
  @type tally :: Type.tally

  @spec new_game :: game
  defdelegate new_game, to: Game

  @spec make_move(game, String.t) :: { game, Type.tally }
  defdelegate make_move(game, guess), to: Game

  @spec tally(game) :: tally()
  defdelegate tally(game), to: Game

end
