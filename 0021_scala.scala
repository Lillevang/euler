object Solution {

    def main(args: Array[String]): Unit = {
        (1 to 10000)
            .map(i => properDivisors(i))
            

    }

    def properDivisors(n: Int) = (1 to n/2).filter(i => n % i == 0)
}