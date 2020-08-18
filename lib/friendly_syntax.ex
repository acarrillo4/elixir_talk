defmodule DiDemo.FriendlySyntax do
  @moduledoc """
  A moduledoc provides documentation for the current module.
  """

  # Custom attributes are most commonly used as constants in Elixir, making the value more visible and reusable.
  @custom_attribute "some_value"

  @doc """
  A doc provides documentation for the function that follows the attribute.
  """

  def i_am_public do
    @custom_attribute
    # i_am_public/0
    # this is a public function with an arity of 0 - meaning it takes no arguments
  end

  def i_am_public(name) do
    # i_am_public/1
    # this is a public function with an arity of 1
  end

  defp i_am_private(name) do
    # i_am_private/1
    # this is a private function with an arity of 1
    # unlike public functions, private functions can only be called from within their own module
  end
end
