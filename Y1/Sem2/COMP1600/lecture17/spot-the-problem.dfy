/* Lecture 17: which of the three questions fails?
   Snippets from COMP1600 2025, tutorial 9, exercises 1 and 6. */

/* --- pair one ------------------------------------------------- */

/* fine: the guard failing IS what we want */
method problem1() returns (x: int)
  ensures x == 20
{
  x := 20;
  while (x < 20)
    invariant x % 2 == 0
    invariant x <= 20 // Redundant
  {x := x + 1;}
  assert !(x < 20);
  assert x % 2 == 0;
}


method broken3() returns (i: int)
{
  i := 0;
  while (i < 97)
    invariant 0 <= i <= 97
  // { i := i + 1; } 
  assert 0 <= i <= 99;
  assert 0 <= i <= 97;
  assert i == 97;
}
