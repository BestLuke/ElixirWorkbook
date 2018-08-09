defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
  # What I believe it does
  # I believe that the code below count's through the items in the strand, and then send's the, 
  # through to an anonymous function where it checks if their a nucleotide
  
  # What it actually does
  # 
    Enum.count(strand, &(&1 == nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
  # What I believe it does
  # I believe that the code below maps the nucleotides and then send's it to an anonymous 
  # function where it calls the count function and send's it the strand and the current nucleotide which then pipes into a map for storage

  # What it actually does
  # 
    Enum.map(@nucleotides, &{&1, count(strand, &1)}) |> Enum.into(%{})
  end
end
