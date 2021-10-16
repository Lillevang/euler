function pythagoreanTriplet(n) {
    for (var a = 1; a <= n / 3; a++) {
        for (var b = a + 1; b <= n / 2; b++) {
            var c = n - a - b;
            if (a * a + b * b == c * c) {
                return { "a": a, "b": b, "c": c };
            }
        }
    }
}
var triplet = pythagoreanTriplet(1000);
var answer = triplet.a * triplet.b * triplet.c;
console.log(answer);
//# sourceMappingURL=solution.js.map