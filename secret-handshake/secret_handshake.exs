defmodule SecretHandshake do
  use Bitwise, only_operators: true
  # What I think it does
  # This makes a callable list of actions that can be called with the @code tag from anywhere

  # What it actually does
  # 

  @codes ["wink", "double blink", "close your eyes", "jump"]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
  # What I think it does
  # result is first declared and to concern it is given the value of {codeword, i}. Then the code back rockets a value into {coderwod, i}
  # of Enum.with_index(@codes) for codeword and (code &&& (1 <<<i)) for i, &&& and <<< are Bitwise operands. The code then confirms there
  # is no empty value by the use of !=0 which checks that the answer doesnt equal zero. The code then goes to give result the value of codeword
  # the code then checks if (code && (1<<<4)) which checks that code is the same as 1<<<4 and then checks again that it is not 0
  # the code then reverses the result if the if statement proved true or gives the result if the if statement was false.

  # What it actually does
  # 
  
    result = for {codeword, i} <- Enum.with_index(@codes), (code &&& (1 <<< i)) != 0, do: codeword
    if (code &&& (1 <<< 4)) != 0 do
      Enum.reverse(result)
    else
      result
    end
  end
end