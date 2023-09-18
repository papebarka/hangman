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

  test "state doesn't change if won or lost" do
    for state <- [:won, :lost] do
      game = Game.new_game("president")

      game = Map.put(game, :game_state, state)
      assert game.turns_left == 7
      { new_game, _tally } = Game.make_move(game, "x")
      assert new_game == game
    end
  end

  test "shouldn't allow duplicate move" do
    game = Game.new_game()
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state != :already_used
    {game, _tally} = Game.make_move(game, "y")
    assert game.game_state != :already_used
    {game, _tally} = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "should record used letters" do
    game = Game.new_game()
    {game, _tally} = Game.make_move(game, "x")
    {game, _tally} = Game.make_move(game, "y")
    {game, _tally} = Game.make_move(game, "x")
    assert MapSet.equal?(game.used, MapSet.new(["x", "y"]))
  end
end
