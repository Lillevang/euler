# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

primes = [2,3,5,7,11,13]
count = 14
until primes.size == 10001
    primes << count unless primes.find {|p| count%p == 0}
    count = count + 1
end

puts primes.last