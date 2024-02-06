defmodule GuessNumber do
  def guess do
    random = Enum.random(1..100)
    IO.puts("Guess a number between 1 and 100")
    guess_loop(random)
  end

  defp guess_loop(num) do
    data = IO.read(:stdio, :line)
    {guess, _rest} = Integer.parse(data)

    cond do
      guess < num ->
        IO.puts("Too low!")
        guess_loop(num)
      guess > num ->
        IO.puts("Too high!")
        guess_loop(num)
      true ->
        IO.puts("That's right!")
    end
  end
end
