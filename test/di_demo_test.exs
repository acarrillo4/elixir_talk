defmodule DiDemoTest do
  use ExUnit.Case
  doctest DiDemo

  test "greets the world" do
    assert DiDemo.hello() == :world
  end
end
