defmodule ElixirBooksTest do
  use ExUnit.Case
  doctest ElixirBooks

  test "greets the world" do
    assert ElixirBooks.hello() == :world
  end
end
