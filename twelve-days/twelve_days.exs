defmodule TwelveDays do
# A callable function that contains all the gifts
  @gifts [
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, and ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, "
  ]
# A callable function that contains all of the days
  @days [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth"
  ]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
  # What I think it does
  # This gets the verse and then based on the day gived the value and takes 1 away from it for iteration, 
  # Then it maps and reverses the gifts so that they appear in the correct order

  # What it actually does
  # 

    "On the #{Enum.at(@days, number - 1)} day of Christmas my true love gave to me, #{Enum.map_join(Enum.reverse(Enum.take(@gifts, number)), &(&1))}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
  # What I think it does
  # This grabs the verses and then runs the verse based on the verse number and then joins the verses with a newline after each

  # What it actually does
  # 
  
    verses = for n <- starting_verse..ending_verse, do: verse(n)
    Enum.join(verses, "\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
  # What I think it does
  # Calls verses with the amount that it needs to cycle through

  # What it actually does
  # 
  
    verses(1, 12)
  end
end
