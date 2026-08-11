enum Month {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
  NotAMonth,
}

void main() {
  Month m = Month.NotAMonth;

  if (m == Month.January) {
    IO.println("It's January");
  } else if (m == Month.August) {
    IO.println("It's August!");
  }

  if (m.equals(Month.August)) {
    IO.println(".equals(August) works too (hopefully)!");
  }

  switch (m) { // Must account for all cases. Otherwise compilation error
    case Month.January -> IO.println("Case: January");
    case Month.February -> IO.println("Case: February");
    case Month.March -> IO.println("Case: March");
    case Month.April -> IO.println("Case: April");
    case Month.May -> IO.println("Case: May");
    case Month.June -> IO.println("Case: June");
    case Month.July -> IO.println("Case: July");
    case Month.August -> IO.println("Case: August");
    case Month.September -> IO.println("Case: September");
    case Month.October -> IO.println("Case: October");
    case Month.November -> IO.println("Case: November");
    case Month.December -> IO.println("Case: December");

    default -> IO.println("Case is everything covered by default");
  };
}
