/* Lecture 17: "the answer we want is the answer to what is left".
   Ported from COMP1600 2025, tutorial 9 exercise 5. */

function euclid(n: nat, m: nat) : nat
  requires m <= n
{ if m == 0 then n else euclid(m, n % m) }

method gcd(n: nat, m: nat) returns (g: nat)
  requires m <= n
  ensures g == euclid(n, m)
{
  var f: nat;
  f, g := m, n;
  while (0 < f) 
    invariant f <= g
    invariant euclid(n, m) == euclid(g,f)
  {
    assert f != 0;
    assert euclid(g, f) == euclid(f,g%f);
    g, f   :=   f, g % f;
  }
  assert f == 0;
  assert euclid(g, f) == g;
}
