defmodule DIDemo.Syntax do
  def hello_di() do
    IO.puts("Helloooooo")
  end

  def hello_di(name) do
    IO.puts("Helloooooo #{name}")
  end

  def im_functional() do
    name = "AMY"
    # name.downcase
    String.downcase(name)
    # to-do use this as a sample to show pattern matching and pipes
  end

  def hungry?() do
    response =
      IO.gets("Are you hungry? (yes/no)")
      |> standardize_input()
        # |> String.downcase()
        # |> String.trim()

      case response do
        "yes" -> taco_time()
        "no" -> IO.puts("Need to write something_to_drink?()")
          _ ->
            IO.puts("That's not the answer I was looking for...let's try this again")
            hungry?()
      end
  end

  def taco_time() do
    IO.puts("Lets TACO bout it")
    tortilla_preference()
  end

  def tortilla_preference() do
    tortilla_preference = IO.gets("What's your tortilla preference? ")
    |> standardize_input()
    # |> String.downcase()
    # |> String.trim()

    tortilla_types = ["corn", "flour", "hard shell"]

    if tortilla_preference in tortilla_types do
      IO.puts("In my Dora La Exploradora voice - DELICIOSO!")
      protein_choices(tortilla_preference)
    else
      IO.puts("That's not authentic, we don't serve that here - sorry not sorry foo")
      {:error}
    end
  end

  def protein_choices("corn") do
    IO.puts("Classic choice - Pick a protein:")
    protein = IO.gets("asada, al pastor, fajitas, veggies? ")
  end

  def protein_choices("flour") do
    IO.puts("Good choice, but your taco options are limited")
    protein = IO.gets("fajitas or veggies? ")
  end

  def standardize_input(input) do
    input
      |> String.downcase()
      |> String.trim()
  end
end

#DIDemo.Syntax.hungry?()

# Steps to building a taco
# hungry? - > yes or no
# if yes, get tacos...if no, ask if they want something to drink
# for tacos, get tortilla preference (corn, flour, hard shell)
# if corn/flour -> move on to meat preferences
# if hard shell -> kill it, we aint got none of that nonsense (or try again? lol )
# meat preferences -> asada, al pastor, fajitas, veggies (rajas con queso - yummmm)
# the re-use for String.downcase and String.trim on input can be moved to its own function to avoid repetition -> DRY
# think of ways to move into salsas or toppings from here - not sure? feel like this is getting all too conditional
# after you solidify this code - think of adding docs
