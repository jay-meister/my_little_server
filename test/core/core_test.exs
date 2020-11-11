defmodule CoreTest do
  use ExUnit.Case

  describe "Core.semi_prime/1" do
    test "valid input response shape" do
      assert {:ok, result} = Core.semi_prime("2")
      assert %{valid?: true, semi_prime?: semi_prime?, number: 2} = result
      assert is_boolean(semi_prime?)
    end
  end

  describe "validates input" do
    test "invalid response shape" do
      assert {:error, result} = Core.semi_prime("")
      assert %{valid?: false, message: "enter a positive integer less than 100'000"} = result
    end

    test "non-integer values" do
      assert {:error, _res} = Core.semi_prime("")
      assert {:error, _res} = Core.semi_prime("1.5")
      assert {:error, _res} = Core.semi_prime("aaa")
    end

    test "invalid integers" do
      assert {:error, _res} = Core.semi_prime("-1")
      assert {:error, _res} = Core.semi_prime("0")
      assert {:error, _res} = Core.semi_prime("100_000")
    end
  end
end
