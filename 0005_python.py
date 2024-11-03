# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


x = 18 * 19 * 20
y = x
while not all([y % e == 0 for e in range(1, 21)]):
    y += x

print(y)