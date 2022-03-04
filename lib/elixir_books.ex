defmodule ElixirBooks do
  @moduledoc """
  Documentation for `ElixirBooks`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirBooks.hello()
      :world

  """
  def get_books do
    IO.puts "Livros Elixir"
    
    case HTTPoison.get("https://elixir-lang.org/learning.html") do
      {:ok, %HTTPoison.Response{body: body}} ->
        content = body 
          |> Floki.find("a.cover")
          |> Floki.attribute("title")
          |> Floki.text(sep: "=>")
          |> String.split("=>")
          
        {:ok, content}
      end
  end
  
  def break_content({_, content}) do
    Enum.map(content, fn s -> 
      IO.puts " " <> s
      IO.puts "---------------"
    end)
  end
end


