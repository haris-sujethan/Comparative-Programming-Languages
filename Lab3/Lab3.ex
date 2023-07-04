defmodule Lab3 do
  def firstTwo(list) do
    y = hd(list)
    x = List.last(list)

    cond do
      x == y -> true
      x != y -> false
    end
  end

  def evenSize(list) do
    x = length(list)

    cond do
      rem(x, 2) == 0 -> true
      rem(x, 2) != 0 -> false
    end
  end

  def frontBack(list) do
    y = hd(list)
    list = tl(list)
    list = list ++ [y]
  end

  def nextNineNine(list) do
    y = hd(list)
    x = tl(list)

    list = [y, 99]
    list = list ++ x
  end

  def isCoord(list) do
    coord = Enum.all?(list, &is_integer/1)

    cond do
      length(list) > 2 ->
        false

      coord ->
        true

      true ->
        false
    end
  end

  def sayHello(list) do
    hello = Enum.member?(list, "Hello")

    cond do
      hello ->
        true

      true ->
        false
    end
  end

  def helloIfSo(list) do
    hello = Enum.member?(list, "Hello")

    cond do
      hello ->
        list = Enum.reject(list, &(&1 == "Hello"))
        list ++ ["Hello"]

      true ->
        list ++ ["Hello"]
    end
  end
end
