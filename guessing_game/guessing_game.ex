defmodule GuessingGame do
  def getInput() do
    lowStr = IO.gets("Lower?\n")
    highStr = IO.gets("High?\n")
    {low, _} = Integer.parse(String.trim(lowStr))
    {high, _} = Integer.parse(String.trim(highStr))
    guess(low, high)
  end

  # defp guess(a, b) when a > b do
  #   guess(b, a)
  # end
  # OR
  defp guess(a, b) when a > b, do: guess(b, a)

  defp guess(low, high) do
    answer = IO.gets("Hmm... maybe you're thinking of #{mid(low, high)}?\n")
    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)
      "smaller" ->
        smaller(low, high)
      "yes" ->
        IO.puts("I knew I could guess your number!")
      _ ->
        IO.puts(~s{Type "bigger", "smaller" or "yes"})
        guess(low, high)
    end
  end

  defp mid(low, high) do
    div(low + high, 2)
  end

  defp bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  defp smaller(low, high) do
    new_high = max(mid(low, high) - 1, low)
    guess(low, new_high)
  end
end

GuessingGame.getInput()
