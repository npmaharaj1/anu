/* 2A.
   The method divide below computes the quotient and remainder of
   n divided by d by repeated subtraction.  Add the precondition
   it needs, and the loop invariant(s) it needs, so that Dafny
   accepts it.

   3 marks (1 for the precondition, 2 for the invariant(s))
*/
method divide(n : nat, d : nat) returns (q : nat, r : nat)
  requires d != 0
  ensures q * d + r == n
  ensures r < d
{
    q, r := 0, n;
    while r >= d
        invariant q * d + r == n
    {
        q := q + 1;
        r := r - d;
    }
}

/* 2B.
   The method min3 below calls min, but Dafny cannot verify min3
   because min has no specification.  Give min a specification
   (and nothing else) so that both methods verify.

   2 marks
*/
method min(x : int, y : int) returns (m : int)
    ensures m == x || m == y
    ensures m <= x && m <= y
{
    if x <= y { m := x; } else { m := y; }
}

method min3(x : int, y : int, z : int) returns (m : int)
  ensures m <= x && m <= y && m <= z
  ensures m == x || m == y || m == z
{
    var t := min(x, y);
    m := min(t, z);
}

/* 2C.
   The method below finds the smallest power of two that is at
   least n.  Add loop invariants so that it verifies.  (Note the
   second postcondition: it is what makes the answer the
   *smallest* such power.)

   3 marks
*/
function pow2(k : nat) : nat
{
    if k == 0 then 1 else 2 * pow2(k - 1)
}

method smallestPow2(n : nat) returns (k : nat, p : nat)
  ensures p == pow2(k) && n <= p
  ensures k > 0 ==> pow2(k - 1) < n
{
    k, p := 0, 1;
    while p < n
        invariant p == pow2(k)
        invariant k > 0 ==> pow2(k-1) < n
    {
        k := k + 1;
        p := 2 * p;
    }
}

/* 2D.
   Dafny cannot prove that the loop below terminates.  Add a
   decreases clause (and nothing else) so that it does.

   2 marks
*/
method countdown2(m : nat, n : nat)
{
    var i : nat, j : nat := m, n;
    while i > 0 || j > 0
        decreases i, j
    {
        if j > 0 {
            j := j - 1;
        } else {
            i := i - 1;
            j := n;
        }
    }
}
