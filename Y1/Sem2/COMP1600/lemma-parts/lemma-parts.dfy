// lemma simple(m:int, n:int)
//   requires m <= n
//   ensures m + 1 < m
// {}

lemma simple(m: int, n: int)
  requires m <= n
  ensures 2*m <= 2*n
{}