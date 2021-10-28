from math import factorial


def formula(n):
    return int(factorial(2 * n) / (factorial(n) * factorial(n)))

print(formula(20))
