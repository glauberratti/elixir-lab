defmodule GuessNumberTest do
  use ExUnit.Case
  doctest GuessNumber

  test "greets the world" do
    assert GuessNumber.guess() == "That's right!"
  end
end
