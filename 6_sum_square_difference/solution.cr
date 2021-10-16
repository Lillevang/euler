sum, var = 0, 0
100.downto(1) { |x| sum = sum + x; var = var + (x*x)}
sum_square = sum * sum
puts sum_square - var