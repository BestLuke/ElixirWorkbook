defmodule Acronym do
    def abbreviate(string) do
        string
        |> to_first_and_capital_letters
        |> Enum.join
        |> String.upcase
    end

    defp to_first_and_capital_letters(string) do
        Regex.scan(~r/\b[a-z]|[A-Z]/, string)
    end
end

defmodule Pig_Latinizer do
    def translate(phrase) do
    phrase 
    |> String.split(" ")
    |> Enum.map_join(" ", fn(word) -> replace(word) end)
    end

    defp replace(word) do
        word
        |> String.replace(~r/^([aeiou].*)/, "\\1ay")
        |> String.replace(~r/^(ch|qu|thr|th|sch)(.*)/, "2\\1ay")
        |> String.replace(~r/^([^aeiou]qu)(.*)/, "2\\1ay")
        |> String.replace(~r/^(?!(a|e|i|o|u|xr|yt))(\w)(.*)/, "\\3\\2ay")
        |> String.replace(~r/^(xr|yt)(.*)/, "\\1\\2ay") 
    end
end

defmodule NucleotideCount do
    @nucleotides [?A, ?C, ?G, ?T]

    def count(strand, nucleotide) do
        Enum.count(strand, &(&1 == nucleotide))
    end

    def histogram(strand) do
        Enum.map(@nucleotides, &{&1, count(strand, &1)}) |> Enum.into(%{})
    end
  end

defmodule Bob do

    def hey(<<>>), do: "Fine Be that way."

    def hey(string) do
        if shout?(string) do
            "Whoa, chill out!"
        else

        _hey(string)
        end
    end

    defp _hey(<<??>>), do: "Sure."
    defp _hey(<<_codepoint>>), do: "Whatever."
    defp _hey(<<head, tail ::binary>>), do: _hey(tail)

    def shout?(string) do
        String.upcase(string) == string
    end
end

defmodule ProteinTranslation do

    def of_rna(rna) do

        codons = 
        rna
        |> String.codepoints
        |> Enum.chunk(3)
        |> Enum.map(&Enum.join/1)

        Enum.reduce_while codons, {:ok, []}, fn x, acc ->
            case of_codon(x) do
                {:ok, "STOP"} -> {:halt, acc}
                {:ok, value} -> {:cont, {:ok, elem(acc, 1) ++ [value]}}
                {:error, _} -> {:halt, {:error, "invalid RNA"}}
            end
        end
    end

    def of_codon(codon) do

        cond do 
            codon in ~w(AUG)                -> {:OK, "Methionine"}
            codon in ~w(UUU UUC)            -> {:OK, "Phenylalanine"}
            codon in ~w(UUA UUG)            -> {:OK, "Leucine"}
            codon in ~w(UCU UCC UCA UCG)    -> {:OK, "Serine"}
            codon in ~w(UAU UAC)            -> {:OK, "Tyrosine"}
            codon in ~w(UGU UGC)            -> {:OK, "Cysteine"}
            codon in ~w(UGG)                -> {:OK, "Tryptophan"}
            codon in ~w(UAA UAG UGA)        -> {:OK, "STOP"} 
            true                            -> {:error, "invalid codon"}
        end
    end
end


defmodule RotationalCipher do

    def rotation(text, shift) do
        Enum.map('#{text}',
        fn
            char when char in ?a..?z -> rem(char - ?a + shift, 26) + ?a
            char when char in ?A..?Z -> rem(char - ?A + shift, 26) + ?A
            char -> char
        end)
        |> to_string
    end
end

defmodule Words do
    import Map

    def count (sentence) do
        sentence
        |> remove_symbols
        |> String.downcase
        |> String.split()
        |> Enum.reduce(%{}, fn(word, map) -> Map.update(map, word, 1, &(&1 + 1)) end)
    end

    defp remove_symbols(str) do
        Regex.replace(~r/[^[:alnum:]-]/u, str, " ")
    end
end

defmodule PasswordCipher do

    @shifter Enum.random(4..24)

    def cipher(pass) do

        pass
        |> rotation(@shifter)
        |> remove_and_replace_vowels
    end

    def rotation(pass, shifter) do
        Enum.map('#{pass}',
        fn
            char when char in ?a..?z -> rem(char - ?a + shifter, 26) + ?a
            char when char in ?A..?Z -> rem(char - ?A + shifter, 26) + ?A
            char -> char
        end)
        |> to_string
    end

    defp remove_and_replace_vowels(pass) do
        
         Regex.replace(~r/([a].)/, pass, "ay")
        
    end

    defp add_and_place_vowels(pass) do
        Regex.replace(~r/(ay.)/), pass,
    end

end