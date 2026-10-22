// ------------------------------------------------------------------
/* Q1: Give this method the specification material it needs in order
   to capture that it is setting every element of the array to take
   on the value k
*/

method setToK(a : array<int>, k : int) 
  ensures forall i : nat | i < a.Length :: a[i] == k
  modifies a
{
  var c : nat := 0;
  while c < a.Length 
    invariant c<= a.Length
    invariant forall i : nat | i < c :: a[i] == k
  {
    a[c] := k;
    c := c + 1;
  }
}

// ------------------------------------------------------------------
/* Q2: Give this method the specification *it* needs in order to 
   capture that it is setting every element of the array a to be 
   equal to the first element of the array squared
*/
method setToFirstSquared(a : array<int>)
  modifies a
  requires a.Length > 0
  ensures forall i : nat | i < a.Length :: a[i] == old(a[0]) * old(a[0])
{
  setToK(a, a[0] * a[0]);
}

// ------------------------------------------------------------------
/* Q3: if your setToFirst spec is good enough, the following method should 
   work, but it will need a lemma proved about the sum of a sequence of
   values, all of which are the same...  Prove that below in the lemma
   constantSeqSum, and then use your lemma after the call to 
   setToFirstSquared.
*/
method arrayOfNines() returns (a:array<int>)
  ensures sum(a[..]) == 36
  ensures a.Length == 4
{
  a := new int[4];
  a[0] := -3;
  setToFirstSquared(a);
  // call constantSeqSum here.
  constantSeqSum(a[..], a[0]);
}

/* with the right precondition, this goes through automatically, with the 
  {} proof
*/
lemma constantSeqSum(s : seq<int>, k : int)
  ensures sum(s) == k * |s|
  requires forall i : nat | i < |s| :: s[i] == k
{}


// ------------------------------------------------------------------
/* Q4: this method changes the array so that its elements are equal
   to the sum of all elements in the array up to that point.  If the
   incoming array has values [1,2,3,4], then it will change to be
   [1,3,6,10]. 
   The lemma sumRight is given in the right place, but you must provide
   the appropriate invariant statements, both about what's changed in 
   the loop so far, and what hasn't...
*/

method prefixSum(a : array<int>)
  modifies a
  ensures forall i :nat :: i < a.Length ==> a[i] == sum(old(a[..i+1]))
{ 
    if a.Length == 0 { return ; }
    var i := 1;
    while i < a.Length 
      invariant i <= a.Length
      invariant forall n : nat | n < i :: a[n] == sum(old(a[..n+1]))
      invariant forall n : nat | i <= n < a.Length :: sum(a[n..]) == sum(old(a[n..]))
    {
      a[i] := a[i] + a[i-1];
      sumRight(old(a[..]), i);
      i := i + 1;
    }
}

/* provided definitions and lemmas about sequence summing... */

function sum(s:seq<int>) : int
{ if s == [] then 0 else s[0] + sum(s[1..])}

lemma sumAppend(s1:seq<int>, s2:seq<int>)
  ensures sum(s1 + s2) == sum(s1) + sum(s2)
{
    if s1 == [] { 
      assert s1 + s2 == s2; 
    } else {
      assert s1 == [s1[0]] + s1[1..];
      assert [s1[0]] + s1[1..] + s2 == [s1[0]] + (s1[1..] + s2);
    }
}

lemma sumRight(s:seq<int>, i:nat)
  requires i < |s|
  ensures sum(s[..i+1]) == sum(s[..i]) + s[i]
{
  assert s[..i+1] == s[..i] + [s[i]];
  sumAppend(s[..i], [s[i]]);
}
