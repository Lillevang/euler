ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

def get_name_list(file_path):
    with open(file_path, "r") as file:
        names = file.read().replace("\"", "").split(",")
    return sorted(names)

def calculate_name_score(name):
    return sum(ord(char) - ord('A') + 1 for char in name)

def calculate_total_score(names):
    total_score = 0
    for i, name in enumerate(names):
        name_score = calculate_name_score(name)
        total_score += name_score * (i + 1)
    return total_score

if __name__ == "__main__":
    names = get_name_list("./0022_names.txt")
    total_score = calculate_total_score(names)
    print(total_score)