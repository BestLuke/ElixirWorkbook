defmodule Words do
	import Map
	
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
		sentence
		|> remove_symbols
		|> String.downcase
		|> String.split()
		|> Enum.reduce(%{}, fn(word, map) -> Map.update(map, word, 1, &(&1 + 1)) end)
  end

	defp remove_symbols(str) do
		# replace unwanted symbols and punctuation with spaces
		#  Regex.replace(~r/[\\p{Punct}&&[^-]]/u, str, " ")
    Regex.replace(~r/[^[:alnum:]-]/u, str, " ")

	end
end