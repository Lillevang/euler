def find_longest_recurring_cycle(limit):
    max_length = 0
    result = 0

    for d in range(2, limit):
        remainders = {}
        value = 1
        position = 0

        while value != 0:
            if value in remainders:
                cycle_length = position - remainders[value]
                if cycle_length > max_length:
                    max_length = cycle_length
                    result = d
                break

            remainders[value] = position
            value = (value * 10) % d
            position += 1
        
    return result

limit = 1000
print(find_longest_recurring_cycle(limit))
