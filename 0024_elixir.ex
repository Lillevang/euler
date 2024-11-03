defmodule LexicographicPermutation do
  @digits [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @target_permutation 1_000_000

  def find_millionth_permutation do
    find_permutation(@target_permutation - 1, @digits, [])
    |> Enum.join("")
  end

  # Recursively calculate the required permutation by selecting the correct digit for each position
  defp find_permutation(0, remaining_digits, result), do: result ++ remaining_digits

  defp find_permutation(index, remaining_digits, result) do
    n = length(remaining_digits) - 1
    fact = factorial(n)
    selected_index = div(index, fact)
    selected_digit = Enum.at(remaining_digits, selected_index)

    find_permutation(
      rem(index, fact),
      List.delete(remaining_digits, selected_digit),
      result ++ [selected_digit]
    )
  end

  # Factorial function
  defp factorial(0), do: 1
  defp factorial(n), do: Enum.reduce(1..n, 1, &*/2)
end

# Run the calculation
IO.puts("The millionth lexicographic permutation of the digits 0-9 is:")
IO.puts(LexicographicPermutation.find_millionth_permutation())
