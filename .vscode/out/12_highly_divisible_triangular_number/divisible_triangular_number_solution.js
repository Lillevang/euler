function getDivisors(n) {
    var divisors = [];
    for (var i = 1; i * i <= n; i++) {
        if (n % i == 0) {
            divisors.push(i);
            if (i != n / i)
                divisors.push(n / i);
        }
    }
    return divisors;
}
var numbers = [];
var found = false;
var cnt = 1;
while (!found) {
    numbers.push(cnt);
    var triangularNumber = numbers.reduce(function (subtotal, element) { return subtotal + element; });
    found = getDivisors(triangularNumber).length > 500;
    if (found) {
        console.log(triangularNumber);
    }
    cnt++;
}
//# sourceMappingURL=divisible_triangular_number_solution.js.map