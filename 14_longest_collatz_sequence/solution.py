from typing import List

# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)
# Which starting number under 1 million gives the longest sequence?

terms_to_one_dict = {13 : 10, 40: 9, 20: 8, 10: 7, 5: 6, 16: 5, 8: 4, 4: 3, 2: 2, 1: 1}

def is_even(n: int) -> bool:
    return n % 2 == 0

def process_n(n: int):
    processed_ns = []
    processed_ns.append(n)
    terms = 0
    sequence_determined = False

    while not sequence_determined:

        if is_even(n):
            n = int(n/2)
        else:
            n = int(3 * n + 1)

        terms += 1
        processed_ns.append(n)

        if n in terms_to_one_dict.keys():
            sequence_determined = True
            terms = terms + terms_to_one_dict[n]
            process_list(processed_ns, terms)

        elif n == 1:
            sequence_determined = True
            process_list(processed_ns, terms)


def process_list(l: List, terms: int) -> None:
    for _ in l:
        terms_to_one_dict[_] = terms
        terms -= 1


def main():
    current_n = 999999
    while (current_n > 1):
        process_n(current_n)
        current_n -= 1
    print(max(terms_to_one_dict, key=terms_to_one_dict.get))


if __name__ == '__main__':
    main()
