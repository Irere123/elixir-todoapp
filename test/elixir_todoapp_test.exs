defmodule ElixirTodoappTest do
  use ExUnit.Case
  doctest ElixirTodoapp

  test "greets the world" do
    assert ElixirTodoapp.hello() == :world
  end
end
