object Solution {

    def main(args: Array[String]): Unit = {
        val amicableNumbers = (1 to 10000).filter(isAmicable)
        val result = amicableNumbers.sum
        println(result)
    }

    def properDivisors(n: Int): Seq[Int] = (1 to n / 2).filter(i => n % i == 0)

    def sumOfDivisors(n: Int): Int = properDivisors(n).sum

    def isAmicable(n: Int): Boolean = {
        val m = sumOfDivisors(n)
        m != n && sumOfDivisors(m) == n
    }
}