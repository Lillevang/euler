object LongestRecurringCycle {

    def findLongestCycle(limit: Int) = {
        (2 until limit).maxBy(cycleLength)
    }

    def cycleLength(d: Int) = {
        def cycleLengthHelper(value: Int, remainders: Map[Int, Int], position: Int): Int = {
            if (value == 0) 0
            else if (remainders.contains(value)) position - remainders(value)
            else cycleLengthHelper((value * 10) % d, remainders + (value -> position), position + 1)
        }
        cycleLengthHelper(1, Map(), 0)
    }

    def main(args: Array[String]): Unit = {
        val limit = 1000
        println(findLongestCycle(limit))
    }
}