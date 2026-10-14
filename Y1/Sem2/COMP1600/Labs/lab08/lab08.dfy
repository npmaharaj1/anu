/* Q1 */
/* Provide the invariants to make the loop go through */
method minMax(a : seq<int>) returns (mn:int, mx:int)
  requires |a| > 0
  ensures mn in a[..] && mx in a[..]
    /* both of these could also be written with indexes, e.g.:
         forall ix : nat :: ix < |a| ==> a[ix] <= mx
    */
  ensures forall i :: i in a[..] ==> i <= mx
  ensures forall i :: i in a[..] ==> mn <= i
{
    mn, mx := a[0], a[0];
    var i := 1;
    while (i < |a|)
      invariant i <= |a|
      invariant mn in a
      invariant mx in a
      invariant a[i-1] <= mx
      invariant forall n :: n in a[..(i-1)] ==> n <= mx
      invariant forall n :: n in a[..(i-1)] ==> n >= mn
      invariant a[i-1] >= mn
    {
        if a[i] < mn { mn := a[i]; }
        if a[i] > mx { mx := a[i]; }
        i := i + 1;
    }
    // i steps up to become the final value of |a|
}

/* Q2 */
/* A simple array problem: we're updating the array "in place" to 
   make all of its elements 0. The method header needs an addition
   (talk to your tutor), and the loop needs invariants */
method zeroIt(a : array<int>)
  ensures forall i :: 0 <= i < a.Length ==> a[i] == 0
  modifies a
{
  var i := 0;
  while i < a.Length 
    invariant i <= a.Length
    invariant forall n :: 0 <= n < i ==> a[n] == 0
  { 
    a[i] := 0;
    i := i + 1; 
  }
}

// ---------------------------------------------
/* A function used in the rest of the lab, 
   for flipping a sequence: */
function reverse<T>(s : seq<T>) : seq<T>
  // it is useful elsewhere for all callers of reverse to have 
  // this extra fact about reverse available
  ensures |reverse(s)| == |s|
{
    if |s| == 0 then [] 
    else reverse(s[1..]) + [s[0]]
}

/* Q3 */
/* Prove that reverse distributes over sequence-append, as per the 
   statement below, and remember the slogan: "structure of proof is
   reflected in structure of function".  */
lemma reverse_append<T>(s1:seq<T>, s2:seq<T>) 
  ensures reverse(s1 + s2) == reverse(s2) + reverse(s1)
{
   if (|s1| == 0) {
    assert s1 + s2 == s2;
  } else {
    assert (s1 + s2)[1..] == s1[1..] + s2;
  }
}

/* Q4 */
/* Come up with the universally (forall) quantified statement relating the
   values of a reversed sequence with the original.  Replace the unachievable
   false below with your own statement.

   For example, if we have s == [1,2,3,4], then reverse(s) = [4,3,2,1] and we
   know that element 0 of s is now at position 3 of reverse(s), that element 
   1 of s is at position 2 of reverse(s), all the way up to element 3 of s being
   at position 0 of reverse(s). 

   Generalise this for all possible sequences of any length and state it.
   If you have the statement right, the proof should be automatic, just {} 
*/
lemma reverseIndices<T>(s:seq<T>)
  ensures forall n :: n in s ==> n in reverse(s)
{ }


/* Q5 */
/* Now write a function that adds up all the elements in a 
   sequence */
function sum(s:seq<int>) : int
  requires |s| >= 0
{
  // this is deliberately bogus and breaks all the lemmas below...
  // |s|+1+(if s != [] then s[0] else 4)
  if (|s| >= 1) then
    s[0] + sum(s[1..])
  else
    0
  
}

/* these results should follow */
lemma sum123() ensures sum([1,2,3]) == 6 {}
lemma sum_empty() ensures sum([]) == 0 {}


/* Q6 */
/* Prove the following. The empty s1 and non-empty s1 cases will need 
   handling separately.  This hinges on associativity of concatenation
   I expect you will have to make an assertion in that line. */
lemma sumAppend(s1:seq<int>, s2:seq<int>)
  ensures sum(s1 + s2) == sum(s1) + sum(s2)
{
  if (|s1| == 0) {
    assert s1 + s2 == s2;
  } else {
    assert s1[1..] + s2 == (s1 + s2)[1..];
  }
}

// [1,2,3,4]
// [2,3,4]
// [4,3,2,1]
// [4,3,2]
// [2,3,4]
/* Q7 */
/* Prove the following; Dafny gets the s == [] case for free, but the 
   other case will need a call to the sumAppend result.  */
lemma sumReverse(s:seq<int>)
  ensures sum(reverse(s)) == sum(s)
{
  if (|s| == 0) {
    assert s == [];
    assert reverse(s) == [];
  } else {
    sumAppend(s, reverse(s));
  }
}