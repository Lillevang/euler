type triplet = {
    a: number,
    b: number,
    c: number
}

function pythagoreanTriplet(n: number): triplet { 
    for  (let a = 1; a <= n / 3; a++) {
        for (let b = a + 1; b <= n / 2; b++) {
            let c = n - a - b;
            if (a * a + b * b == c * c) {
                return {"a": a, "b": b, "c": c}
            }
        }
    }
    return {"a": 0, "b": 0, "c": 0}
}

const triplet = pythagoreanTriplet(1000)
const answer = triplet.a * triplet.b * triplet.c
console.log(answer)