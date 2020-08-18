defmodule DIDemo.FriendlySyntax do
  @available_attribute "value"

  def i_am_public do
    #function with arity 0 - meaning # of arguments
  end

  def i_am_public(name) do
    # function with arity 1
  end

  defp i_am_private(name) do
    # private function
  end
end
