// tightest (light multiplication): &&, ||
// Next leve: ==>
// last is: <==>

lemma imp_conj_equiv(p:bool, q:bool, r:bool)
  ensures (p ==> (q ==> r)) <==> ((p && q) ==> r) {}

lemma demorgan(a:bool, b:bool)
  ensures !(a && b) <==> !a || !b
  ensures !(a || b) <==> !a && !b {}

// and-idstributes over or  : analogue of x*(y+z) == x*y+x*z

// or-distributes over and

// implication is just fancy disjunction
lemma imp_disj(p:bool, q:bool)
  ensures ((p ==> q) <==> (!p || q)) {}

// i != i - 3 (if i lies between 0 and 3)
lemma example1(i: int)
  // if integer i lies between 0 and 3, then i != 3 - 1
  // informal argument?
  requires 0 < i requires i < 3
  ensures i != 3 - i {}

// induction
function sumUpTo(m:nat) : nat {
  if m == 0 then 0 else m + sumUpTo(m-1)
}

method Main()
{
  print "sum(2) ==", sumUpTo(2), "\n";
}
