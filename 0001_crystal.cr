# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

x = 999
a = 3
b = 5

def sum(a, x)
    b = (x/a).floor
    a * (b+1) * b/2
end

puts (sum(a,x) + sum(b,x) - sum(a*b, x)).to_i