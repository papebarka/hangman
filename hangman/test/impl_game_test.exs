defmodule ImplGameTest do
  use ExUnit.Case

  alias Hangman.Impl.Game

  test "new game returns struct" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new game returns president" do
    game = Game.new_game("president")

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert game.letters == ["p", "r", "e", "s", "i", "d", "e", "n", "t"]
  end
end
