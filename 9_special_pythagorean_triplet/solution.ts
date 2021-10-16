function pythagoreanTriplet(n: number) { 
    for  (let a = 1; a <= n / 3; a++) {
        for (let b = a + 1; b <= n / 2; b++) {
            let c = n - a - b;
            if (a * a + b * b == c * c) {
                return {"a": a, "b": b, "c": c}
            }
        }
    }
}

const triplet = pythagoreanTriplet(1000)
const answer = triplet.a * triplet.b * triplet.c
console.log(answer)