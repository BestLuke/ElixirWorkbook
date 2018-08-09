# defmodule Acronym do
#   @doc """
#   Generate an acronym from a string.
#   "This is a string" => "TIAS"
#   """
#   @spec abbreviate(String.t()) :: String.t()
#   def abbreviate(string) do
#     words = String.split(string)

#     # pattern = Enum.map(words, fn (word) -> hd(word).join('') end)
#     Enum.map(words, fn (word) -> letters = String.split(word) end)
#     # pattern = words.map(function(word) -> word[0]).join('')
#   end
# end

defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    # What I think this does
    # This grabs the string that we need to abbreviate and first pipes it into the to_first_and_capital_letters function, once that function is done
    # it then pipes into a mechanism joins the letters into one word and finally pipes it into String.upcase which capitalizes it.

    # What it actually does
    # 

      |> to_first_and_capital_letters
      |> Enum.join
      |> String.upcase
  end

  defp to_first_and_capital_letters(string) do
    # What I think this does
    # Once the code enter's this it uses a Regex.scan which searches the string for words depicted in the regex code,
    # then the regex initializes and enters the expression, with the \b regex it get's all the whitespace from the 
    # string and makes it so that the [a-z] | [A-Z] selects only the first letter of the string's words and not every 
    # letter of the string. Finally the string is the parsed through element which is to be regex'ed.

    # What it actually does
    # 
    
    Regex.scan(~r/\b[a-z]|[A-Z]/, string)
  end
end
