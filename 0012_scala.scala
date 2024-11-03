object TriangularFactors {

    def main(args: Array[String]): Unit = println {

        triangularNumbers.find{ getNumberofFactors(_) > 500 }
    }

    def getNumberofFactors(number: BigInt) = {
        2 * Iterator
            .iterate(BigInt(1))(_ + 1)
            .takeWhile(_ <= BigInt(math.sqrt(number.toDouble).toInt))
            .filter(number % _ == 0)
            .length
    }

    lazy val triangularNumbers = Iterator
        .iterate((1,1)) { case (i, t) => (i + 1, t+ i + 1) }
        .map { case (_, t) => BigInt(t) }
}