defmodule NonAbundantSums do
  @limit 28123

  def calculate_non_abundant_sum do
    # Step 1: Identify all abundant numbers up to @limit
    abundant_numbers = for n <- 1..@limit, is_abundant(n), do: n

    # Step 2: Create a MapSet of sums of two abundant numbers to allow fast lookup
    abundant_sums =
      Enum.reduce(abundant_numbers, MapSet.new(), fn a, set ->
        Enum.reduce_while(abundant_numbers, set, fn b, acc ->
          sum = a + b
          if sum > @limit, do: {:halt, acc}, else: {:cont, MapSet.put(acc, sum)}
        end)
      end)

    # Step 3: Sum all numbers from 1 to @limit not in the abundant_sums set
    Enum.reduce(1..@limit, 0, fn x, acc ->
      if MapSet.member?(abundant_sums, x), do: acc, else: acc + x
    end)
  end

  # Check if a number is abundant
  defp is_abundant(n) do
    n < sum_of_proper_divisors(n)
  end

  # Calculate the sum of proper divisors of a number
  defp sum_of_proper_divisors(n) do
    if n == 1 do
      0
    else
      1..(n |> div(2))
      |> Enum.filter(fn x -> rem(n, x) == 0 end)
      |> Enum.sum()
    end
  end
end

# Run the calculation
IO.puts("Sum of all positive integers that cannot be written as the sum of two abundant numbers:")
IO.puts(NonAbundantSums.calculate_non_abundant_sum())
