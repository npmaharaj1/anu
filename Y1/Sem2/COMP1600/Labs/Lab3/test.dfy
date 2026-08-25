function daysUpToStartOf (m:nat, isLeapYear : bool) : nat
  requires 0 <= m <= 11
{
  match m
    case 0 => 0
    case _ => daysInMonth(m, isLeapYear) + daysUpToStartOf(m-1, isLeapYear)
}

function daysInMonth(m : nat, isLeapYear : bool) : nat
  requires 0 <= m <= 11
{
  match m
    case 0 => 31
    case 2 => 31
    case 4 => 31
    case 6 => 31
    case 7 => 31
    case 9 => 31
    case 11 => 31

    case 8 => 30
    case 3 => 30
    case 5 => 30
    case 10 => 30

    case 1 => if isLeapYear then
                29
              else
                28
}

method Main() {
  print daysUpToStartOf(3, true);
}
