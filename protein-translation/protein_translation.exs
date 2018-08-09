defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do

  # What I think it does
  # So condons is where it gets the rna and then pipes it down to break into codepoints,
  # after that it pipes to get put into one of the 3 letter codes so that condon can work with it properly
  # then it makes an Enum.map where it calls an anonymous function that Enum.joins the elements returned from .chunk. This is done to connect only
  # combined points and not revert all progress. Enum.reduce_while then goes through and for each condon makes a tuple and sends it through to of_condon
  # This then gets the returned accelerator and gives it ok until it get's stopped or has an invalid RNA

  # What it actually does
  # 

    codons =
      rna
        |> String.codepoints
        |> Enum.chunk(3)
        |> Enum.map(&Enum.join/1)
      
      IO.inspect(codons)
      
    Enum.reduce_while codons, {:ok, []}, fn x, acc ->
    IO.inspect(acc)
    # IO.inspect(x)

      case of_codon(x) do
        {:ok, "STOP"} -> {:halt, acc}
        {:ok, value}  -> {:cont, {:ok, elem(acc, 1) ++ [value] }}
        {:error, _}   -> {:halt, {:error, "invalid RNA"}}
        
        
      end
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
  # What I think it does
  # This function goes through sends the condon through each check where ~w can break up a list without needing " " as some condons refer to same item
  # thus then gets the accelerator and sends it back up to rna

  # What it actually does
  # 

    cond do
    # ~w = word list /// converts given input into strings seperated by spaces

      codon in ~w(AUG)              -> {:ok, "Methionine"}
      codon in ~w(UUU UUC)          -> {:ok, "Phenylalanine"}
      codon in ~w(UUA UUG)          -> {:ok, "Leucine"}
      codon in ~w(UCU UCC UCA UCG)  -> {:ok, "Serine"}
      codon in ~w(UAU UAC)          -> {:ok, "Tyrosine"}
      codon in ~w(UGU UGC)          -> {:ok, "Cysteine"}
      codon in ~w(UGG)              -> {:ok, "Tryptophan"}
      codon in ~w(UAA UAG UGA)      -> {:ok, "STOP"}
      true                          -> {:error, "invalid codon"}
    end
  end
end