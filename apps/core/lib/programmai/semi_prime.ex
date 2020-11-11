defmodule Programmai.SemiPrime do
  @spec check(pos_integer()) :: boolean()
  def check(1), do: false
  def check(2), do: false

  def check(n) when n > 2 and n < 100_000 and is_integer(n) do
    possible_prime_factors = 2..(div(n, 2) + 1)

    do_check(n, Enum.to_list(possible_prime_factors), [])
  end

  # n has too many prime factors
  def do_check(_n, _poss_factors, [_, _, _]), do: false

  # n is prime number
  def do_check(_n, [], []), do: false

  # n is semi prime!
  def do_check(1, _poss_factors, [_, _]), do: true

  def do_check(n, [poss_factor | tail], prime_factors) do
    if rem(n, poss_factor) == 0 do
      new_n = div(n, poss_factor)
      do_check(new_n, [poss_factor | tail], [poss_factor | prime_factors])
    else
      do_check(n, tail, prime_factors)
    end
  end
end
