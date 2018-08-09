# defmodule PigLatin do
#   @doc """
#   Given a `phrase`, translate it a word at a time to Pig Latin.

#   Words beginning with consonants should have the consonant moved to the end of
#   the word, followed by "ay".

#   Words beginning with vowels (aeiou) should have "ay" added to the end of the
#   word.

#   Some groups of letters are treated like consonants, including "ch", "qu",
#   "squ", "th", "thr", and "sch".

#   Some groups are treated like vowels, including "yt" and "xr".
#   """
#   @spec translate(phrase :: String.t()) :: String.t()
#   def translate(phrase) do
#   end
# end



# vowels: [Character] = ["a","e","i","o","u"]

# words = String.split(phrase)
# Enum.each(words, fn (word) -> if(vowels.contains(word.lowercased().characters.first!){
#   word = [word | "ay"]
# } else {
#   a = word.first!
  
# }
# ))

defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    # What I think this does
    # I think this gets the phrase and then pipes it into a string.split that breaks the phrase up at the blanks, it then 
    # pipes the split phrase into a map.join which joins and adds a space between the combined list items and declared a 
    # function which then calls to replace each individual word before it's sewn back together

    # What it actually does
    # 
    
    |> String.split(" ")
    |> Enum.map_join(" ", fn(word) -> replace(word) end)
  end

  defp replace(word) do
    word
    # What I think this does
    # ~r initiates the regex, / appears twice and let's us know that the regular expression has ended and the expression flags have started, 
    # ^ searches for the pattern at the begining of the string, () groups the metachars together for searches, [] lets us search for multiple 
    # characters such as aeio or u, . is used to match every character after the beginning, and * lets the regex know to used . zero or more times, 
    # \\1ay is then used to add ay to the end of the word, when \\2\\1ay comes around it is getting the letters to move to the back and then adding 
    # ay to the end

    # What it actually does
    # 

    |> String.replace(~r/^([aeiou].*)/, "\\1ay")
    |> String.replace(~r/^(ch|qu|thr|th|sch)(.*)/, "\\2\\1ay")
    |> String.replace(~r/^([^aeiou]qu)(.*)/, "\\2\\1ay")
    |> String.replace(~r/^(?!(a|e|i|o|u|xr|yt))(\w)(.*)/, "\\3\\2ay")
    |> String.replace(~r/^(xr|yt)(.*)/, "\\1\\2ay")
  end

end