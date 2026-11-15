/* SAMPLE FINAL EXAM 2026: Question 5.

   5 marks in total

   This question is only for COMP6260 students.

   Replace /* YOUR WORK GOES HERE */ comments with your
   work.  Leave everything else untouched.

   Remember that when asked to prove a lemma, you need to
   have a proof.  Remember to include the {} and any
   necessary proof-steps within the braces !
*/

/* sorted: every pair of elements is in order */
predicate sorted(s : seq<int>)
{
    forall i, j | 0 <= i < j < |s| :: s[i] <= s[j]
}

/* adjSorted: every ADJACENT pair of elements is in order */
predicate adjSorted(s : seq<int>)
{
    forall i | 0 <= i < |s| - 1 :: s[i] <= s[i+1]
}

/* 5A.
   State and prove that a sequence that is adjSorted is also
   sorted.

   HINT: Dafny will not do this on its own.  One approach is
   induction on the sequence, peeling off s[0]: if s[1..] is
   sorted, and s[0] <= s[1], then everything in s[1..] is at
   least s[0].

   3 marks
*/
lemma adjSorted_sorted(s : seq<int>)
/* YOUR WORK GOES HERE */

/* 5B.
   Write the body of isSorted, using a while loop that checks
   adjacent pairs, so that the method verifies.  You will want to
   use your lemma from 5A.

   2 marks
*/
method isSorted(a : array<int>) returns (b : bool)
  ensures b <==> sorted(a[..])
/* YOUR WORK GOES HERE */
