defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  # @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
  # What I think it does
  # Enum.map splits the text into 

  # What it actually does
  # 

    Enum.map('#{text}', 
      fn
        char when char in ?a..?z -> rem(char - ?a + shift, 26) + ?a
        char when char in ?A..?Z -> rem(char - ?A + shift, 26) + ?A
        char -> char
    end)
    |> to_string
  end
end
