import java.time.DayOfWeek;
import java.util.Date;

object Solution_scala {

    def main(args: Array[String]): Unit = {
        println(usingLibraries.length) // Equal to the java solution
        println(noLibraries.length)
    }

    def usingLibraries = {
        val firstOfJanuary1901 = java.time.LocalDateTime.of(1901, 1, 1, 0, 0)
        Iterator
            .iterate(firstOfJanuary1901)(_.plusMonths(1))
            .takeWhile(_.getYear <= 2000)
            .filter{_.getDayOfWeek == DayOfWeek.SUNDAY}
            .map(x => (x.getYear, x.getMonth))
    }

    def noLibraries = Iterator
        .iterate(Item(1900, January, 0)) { case Item(year, month, totalDays) =>
            Item(if (month == December) year + 1 else year, month.next, totalDays + month.days(year))
        }
        .dropWhile{ case Item(year, _, _) => year <= 1900 }
        .takeWhile{ case Item(year, _, _) => year <= 2000 }
        .filter{ case Item(_, _, totalDays) => totalDays % 7 == 6 }

    case class Item(year: Int, Month: Month, daysElapsed: Int)

    sealed trait Month {
        def days(year: Int): Int
        def next: Month
    }

    case object January   extends Month { def days(year: Int): Int = 31; def next: Month = February              }
    case object February  extends Month { def days(year: Int): Int = getDaysInFeb(year); def next: Month = March }
    case object March     extends Month { def days(year: Int): Int = 31; def next: Month = April                 }
    case object April     extends Month { def days(year: Int): Int = 30; def next: Month = May                   }
    case object May       extends Month { def days(year: Int): Int = 31; def next: Month = June                  }
    case object June      extends Month { def days(year: Int): Int = 30; def next: Month = July                  }
    case object July      extends Month { def days(year: Int): Int = 31; def next: Month = August                }
    case object August    extends Month { def days(year: Int): Int = 31; def next: Month = September             }
    case object September extends Month { def days(year: Int): Int = 30; def next: Month = October               }
    case object October   extends Month { def days(year: Int): Int = 31; def next: Month = November              }
    case object November  extends Month { def days(year: Int): Int = 30; def next: Month = December              }
    case object December  extends Month { def days(year: Int): Int = 31; def next: Month = January               }

    def getDaysInFeb(year: Int) = if (isLeapYear(year)) 29 else 28;

    def isLeapYear(year: Int) = year % 4 == 0 && !isCentury(year);

    def isCentury(year: Int) = year % 100 == 0;
}