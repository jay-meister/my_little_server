defmodule Programmai do
  def semi_prime(input) do
    with {:ok, integer} <- parse_integer(input),
         {:ok, integer} <- validate_integer(integer),
         semi_prime? <- Programmai.SemiPrime.check(integer) do
      {:ok,
       %{
         valid?: true,
         semi_prime?: semi_prime?,
         number: integer
       }}
    else
      :error ->
        {:error,
         %{
           valid?: false,
           message: "enter a positive integer less than 100'000"
         }}
    end
  end

  def parse_integer(binary) do
    case Integer.parse(binary) do
      {number, ""} -> {:ok, number}
      _ -> :error
    end
  end

  def validate_integer(integer) when is_integer(integer) do
    if integer > 0 and integer < 100_000 do
      {:ok, integer}
    else
      :error
    end
  end
end
