# Start from buttom, compare two next numbers. Add highest to the number in the row above.

from typing import List
import os

def parse_triangle() -> List[List[int]]:
    # Hack to allow debugging in VS Code
    script_dir = os.path.dirname(os.path.realpath(__file__))
    triangle = os.path.join(script_dir, "triangle.txt")

    with open(triangle) as file:
        return list(reversed([[int(_) for _ in l.rstrip().split(" ")] for l in file.readlines()]))


def find_maximum_path(triangle: List[List[int]]) -> int:
    # We go from buttom to the second highest row. 
    # Once we're this far the solution will be the top most number
    for row_no in range(len(triangle) - 1): 
        cur_row = triangle[row_no]
        for i in range(len(cur_row) - 1):
            triangle[row_no + 1][i] = triangle[row_no + 1][i] + max(cur_row[i], cur_row[i + 1])
    print(triangle[-1][0])

def main():
    triangle = parse_triangle()
    find_maximum_path(triangle)

if __name__ == "__main__":
    main()
