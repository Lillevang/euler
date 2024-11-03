defmodule FibonacciDigits do
  @target_digits 1000

  def find_index_of_first_1000_digit_term do
    # Start the sequence with F1 = 1 and F2 = 1, so index 1 and 2 are both 1
    Stream.unfold({1, 1, 2}, fn {a, b, index} ->
      next_fib = a + b
      {{index, b}, {b, next_fib, index + 1}}
    end)
    |> Enum.find(fn {_, fib} ->
      String.length(Integer.to_string(fib)) >= @target_digits
    end)
    |> elem(0)
  end
end

# Run the calculation
IO.puts("Index of the first term in the Fibonacci sequence to contain 1000 digits:")
IO.puts(FibonacciDigits.find_index_of_first_1000_digit_term())
