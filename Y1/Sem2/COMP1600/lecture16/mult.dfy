/* Lecture 16: counting + computing.
   Ported from COMP1600 2025, week10-code.dfy (mult). */

method mult(m: int, n: int) returns (r: int)
  requires n >= 0
  ensures r == n * m
{
  var x: int;
  r, x := 0, 0;
  while (x < n)
    invariant x <= n      // counting
    invariant x * m == r  // computing, explains what's happening with step case
  {
    x := x + 1;
    r := r + m;
  }
  
  assert x == n; // invariant AND NOT(guard)
  assert r == m * x; // invariant
  assert r == m * n; // substitute one into the other (final case)
}

/* Try deleting each invariant in turn, and read the complaint. */
/*
  if assertions work while one above fails, it's assuming the failed one
  is true for the future assertion
/*
