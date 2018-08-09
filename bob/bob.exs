# defmodule Bob do
#   def hey(input) do
#     input = input |> String.trim
#     cond do
#       String.last(input) == "?" -> "Sure."
#       String.length(input) == 0 -> hey()
#       all_capitals?(input) -> "Whoa, chill out!"
#       true -> "Whatever."

#     end
#   end

#   def hey do
#     "Fine. Be that way!"
#   end

#   def all_capitals?(input) do
#     sans_numbers = strip_numbers(input)
#     String.upcase(sans_numbers)  == sans_numbers && any_letters?(sans_numbers)
#   end

#   def strip_numbers(input) do
#     Regex.replace(~r/[0-9]/,input,"")
#   end



#     def hey(input) String.last(input) == "?" do
#      "Sure."
#     end

#     def hey(input) String.length(input) == 0 do
#      "Fine. Be that way!"
#     end

#     def hey(input) all_capitals?(input) do
#      "Whoa, chill out!"
#     end

#     def hey() do 
#     "Whatever!" 
#     end   
# end

defmodule Bob do

  def hey(<<>>), do: "Fine. Be that way."

  def hey(string) do
    if shout?(string) do
      "Whoa, chill out!"
    else
      # need to do rest of processing with different function so shout check
      # only happens over entire string and doesn't match on partial string.
      _hey(string)
    end
  end

  defp _hey(<<??>>), do: "Sure."
  defp _hey(<<_codepoint>>), do: "Whatever."
  defp _hey(<<head, tail :: binary>>), do: _hey(tail)

  @doc """
  Whether a string is a shout (in ALL CAPS).  Works with non-ascii unicode
  characters.
  """
  def shout?(string) do
    # Use upcase for unicode handling
    String.upcase(string) == string
  end
end
