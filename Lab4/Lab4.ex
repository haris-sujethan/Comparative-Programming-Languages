defmodule Lab4 do
  @moduledoc """
    Fill in the functions for lab 4 below. Fuction skeletons with dummy return values are provided.
    Your task is to fill in these functions to accomplish what is described in the lab description.
    You may also add additional helper functions if you desire.
    Hint: You'll need to add tail recursive signatures. See the MyEnum examples from class
    for examples of this.
    Test your code by running 'mix test' from the cps506_lab4 directory in a terminal.
  """
  def isAscending?(items) do
    case items do
      [] -> true
      [_] -> true
      [head | tail] when tail == [] or head < hd(tail) -> isAscending?(tail)
      _ -> false
    end
  end

  def onlyOddDigits?(n) do
    if n < 10 do
      n in [1, 3, 5, 7, 9]
    else
      # n = 1234, lastNum =  4
      lastNum = rem(n, 10)

      if lastNum in [1, 3, 5, 7, 9] do
        # gets the first nums again, n = 1234 get 123
        onlyOddDigits?(div(n, 10))
      else
        false
      end
    end
  end

  def tailFib(n) do
    tailFibHelper(n, 1, 1)
  end

  defp tailFibHelper(n, a, b) when n == 1 or n == 2 do
    b
  end

  defp tailFibHelper(n, a, b) when n > 2 do
    tailFibHelper(n - 1, b, a + b)
  end

  def giveChange(n, coins) do
    giveChangeHelp(n, coins, [])
  end

  def giveChangeHelp(0, _, result) do
    result
  end

  def giveChangeHelp(_, [], _), do: :error

  def giveChangeHelp(n, [coin | tail], result) when n >= coin do
    num_coins = div(n, coin)
    remaining = rem(n, coin)
    new_result = result ++ List.duplicate(coin, num_coins)
    giveChangeHelp(remaining, tail, new_result)
  end

  def giveChangeHelp(n, [_ | tail], result) do
    giveChangeHelp(n, tail, result)
  end

  def reduce(items, fun) do
    reduceHelp(items, fun, 0)
  end

  def reduce(items, acc, fun) do
    reduceHelp(items, fun, acc)
  end

  defp reduceHelp([head | tail], fun, acc) when is_binary(acc) do
    reduceHelp(tail, fun, acc <> to_string(head))
  end

  defp reduceHelp([head | tail], fun, acc) do
    reduceHelp(tail, fun, fun.(head, acc))
  end

  defp reduceHelp([], _fun, acc) do
    acc
  end
end
