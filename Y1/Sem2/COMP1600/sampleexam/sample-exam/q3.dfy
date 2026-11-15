/* 3A.
   Define the recursive function count, which returns the number
   of times x occurs in the sequence s.  Your definition should
   look at s[0] and recurse on s[1..].

   1 mark
*/
function count(x : int, s : seq<int>) : nat
{
   if |s| == 0 then 0 else if s[0] == x then 1 + count(x, s[1..]) else count(x, s[1..])
}

/* 3B.
   State and prove the testing lemma saying that 2 occurs twice
   in the sequence 2, 1, 2, 3.

   1 mark
*/
lemma count_2123()
   ensures count(2, [2,1,2,3]) == 2
{}

/* 3C.
   State and prove that counting in the concatenation of two
   sequences gives the sum of the counts in each.

   HINT: Dafny will need to be told some facts about sequences
   being equal.  Think about what s1 + s2 looks like when s1 is
   empty, and what (s1 + s2)[1..] is when it isn't.

   3 marks
*/
lemma count_append(x : int, s1 : seq<int>, s2 : seq<int>)
   ensures count(x, s1+s2) == count(x, s1) + count(x, s2)
{
   if (s1 == []) {
      assert s1 + s2 == s2;
   } else {
      assert s1 == [s1[0]] + s1[1..];
      assert [s1[0]] + s1[1..] + s2 == [s1[0]] + (s1[1..] + s2);
   }
}

/* 3D.
   State and prove that the count of x in s is positive if and
   only if x is in s (use the built-in "in" operator on
   sequences).

   2 marks
*/
lemma count_pos(x : int, s : seq<int>)
   ensures count(x, s) > 0 <==> x in s
{}

/* 3E.
   The method countM computes count(x, s) with a loop that works
   from the END of the sequence towards the front.  Add loop
   invariants so that it verifies.

   (Why work from the end?  Think about which slice of s the
   recursive definition of count makes easy to talk about.)

   3 marks
*/
method countM(x : int, s : seq<int>) returns (c : nat)
  ensures c == count(x, s)
{
    var i := |s|;
    c := 0;
    while i > 0
      invariant i >= 0
      invariant c == count(x,s[i..])
    {
        i := i - 1;
        if s[i] == x { c := c + 1; }
    }
}
