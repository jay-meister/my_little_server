defmodule Programmai.SemiPrimeTest do
  use ExUnit.Case

  describe "Programmai.SemiPrime.check" do
    test "prime number is not semi prime" do
      assert Programmai.SemiPrime.check(2) == false
      assert Programmai.SemiPrime.check(3) == false
      assert Programmai.SemiPrime.check(5) == false
    end

    test "more than 2 prime factors is not semi prime" do
      assert Programmai.SemiPrime.check(2 * 2 * 2) == false
      assert Programmai.SemiPrime.check(2 * 3 * 5) == false
    end

    test "precisely 2 prime factors is semi prime" do
      assert Programmai.SemiPrime.check(2 * 2) == true
      assert Programmai.SemiPrime.check(2 * 3) == true
      assert Programmai.SemiPrime.check(2 * 5) == true
    end

    test "prop test - 2 primes factors is semi prime" do
      primes = [2, 3, 5, 7, 11, 13, 19, 23, 29]

      for _ <- 1..50 do
        p_1 = Enum.random(primes)
        p_2 = Enum.random(primes)

        assert Programmai.SemiPrime.check(p_1 * p_2) == true,
               "#{p_1} * #{p_2} expected to create semi prime"
      end
    end
  end
end
