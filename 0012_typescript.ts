
function getDivisors(n :number) {
    let divisors : number[]  = [];
    for (let i = 1; i * i <= n; i++ ) {
        if (n % i == 0) {
            divisors.push(i);
            if (i != n / i) divisors.push(n / i);
        }
    }
    return divisors;
}


let numbers :number[] = [];
let found = false;
var cnt = 1;
while (!found) {
    numbers.push(cnt);
    var triangularNumber = numbers.reduce((subtotal, element) => subtotal + element);

    found = getDivisors(triangularNumber).length > 500;
    if (found) {
        console.log(triangularNumber);
    } 
    cnt++;
}