import numba as nb
import math

@nb.njit
def trinum2(n, dik):
    if n in dik:
        return dik[n]
    else:
        ans = n + trinum2(n-1, dik)
        dik[n] = ans
        return ans

@nb.njit
def divisors3(n):
    divs = 0
    for i in range(int(math.sqrt(n)),0,-1):
        if n % i == 0:
            divs += 2
    return divs

@nb.njit
def search2(maks):
    count = 1
    no_of_divs = 0
    trianglenumber = 1
    while no_of_divs < maks:
        no_of_divs = divisors3(trianglenumber)
        if no_of_divs >= maks:
            return trianglenumber, no_of_divs
        count += 1
        trianglenumber += count
    return trianglenumber, no_of_divs

print(search2(500)[0])