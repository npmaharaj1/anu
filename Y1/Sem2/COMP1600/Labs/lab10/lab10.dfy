/* Verifying insertion Sort in many stages

   This is a big file, but the basic structure is 3 questions

   1. Properly characterising sortedness and the 'is a lower bound for a list' 
      predicate
   2. Showing that insertion preserves sortedness (i.e., if you use the insert
      function to insert something into a list that is already sorted, the result
      is also sorted).  [This is the HARDEST question by far.]
   3. The multiset-equality / permutation requirement of sorting, leading to
      final correctness of the whole algorithm.

 */

/* Back to lists as per the first half of the semester */
datatype list<T> = Nil | Cons(hd:T, tl:list<T>)
//------------------------------------------------------------------------
// Now define the first function of insertion sort, something that takes
// a single integer, and inserts it into the right place within a list
// that we assume is already sorted.

function insert(i : int, l : list<int>) : list<int>
{
    match l 
    case Nil => Cons(i,Nil)
    case Cons(h,t) => if i <= h then Cons(i,l) else Cons(h,insert(i,t))
}

//------------------------------------------------------------------------
// Then call this recursively to sort a whole list. Whole algorithm is 
// super-simple; just 4 or 5 lines of real code. (Still O(n^2) though, :( ))
function insertionSort(l : list<int>) : list<int>
{
  match l case Nil => Nil
  case Cons(h,t) => insert(h, insertionSort(t))
}




// necessary infrastructure; 

/* First, define what it is to be a sorted list, using a less-or-equal to 
   all auxiliary */
predicate sortedList(l : list<int>)
{
  match l 
  case Nil => true
  case Cons(h,t) => sortedList(t) && leAll(h,t)
}

predicate leAll(i:int, s:list<int>)
{
    match s
    case Nil => true
    case Cons(h,t) => i <= h && leAll(i,t)
}

// an alternative, quantified version of leAll. 
// This uses member (defined at bottom of file because you've
// seen it before)
ghost predicate leAllQ(i:int, l:list<int>)
{
  forall j | member(j,l) :: i <= j
}


/* Q1 ***************/
// Prove the two leAll characterisations are equivalent;
// You will be providing the results for right-to-left 
lemma leAll_member(i : int, l : list<int>)
  ensures leAll(i,l) <==> leAllQ(i,l)
{
  if leAll(i,l) { leAll_memberLR(i,l); } 
  // either keep this commented out, 
  // else { leAll_memberRL_CP(i,l);}
  // OR: uncomment line above and comment out next line
  if leAllQ(i,l) { leAll_memberRL(i,l); }
  // using fact that  
  // p ⇔ q  same as 
  //    (p ⇒ q) ∧ (q ⇒ p) 
  // but also same as 
  //    (p ⇒ q) ∧ (¬p ⇒ ¬q)
}

/* Left to right direction is automatic */
lemma leAll_memberLR(i:int, l:list<int>)
  requires leAll(i,l)
  ensures leAllQ(i,l)
{}

// You need to either prove the following implication or its contrapositive.

/******* Q1(a) */
lemma leAll_memberRL(i : int, l : list<int>)
  requires leAllQ(i,l)
  ensures leAll(i,l)
{
  lemma leAll_memberLR(i, l)
}

// contrapositive version
/******** Q1(b) */
lemma leAll_memberRL_CP(i:int, l:list<int>)
  requires !leAll(i,l)
  ensures !leAllQ(i,l)
{
}

// useful in Q2
lemma member_insert(h:int, i:int, l:list<int>)
  ensures member(h,insert(i,l)) <==> h == i || member(h,l)
{}

/******* Q2 */
// Prove this critical result about inserting into a sorted list
// insert is recursive, so your proof will need to reflect that with 
// match and cases of its own. 
// Within the Cons case, there will need to be a case-split (just as there
// is in the insert body), on whether or not i <= the first element of the list.
// Then, the easiest way of establishing the necessary leAll facts will be via
// the quantified characterisation, which will in turn require appeals to 
// leAll_member, and proving forall facts.
//
// The syntax for that is 
//    forall var ensures property { ... }
lemma insertSorted(i:int, l:list<int>)
  requires sortedList(l)
  ensures sortedList(insert(i,l))
{
}

/* *********** PART 3 **************/

/* answers the question: how many occurrences of i are there in list l? */
function countI(i : int, l : list<int>) : nat
{
  match l case Nil => 0
  case Cons(h,t) => (if h == i then 1 else 0) + countI(i,t)
}

/* allows definition of "multiset equality" for lists" */
ghost predicate mseqLists(l1 : list<int>, l2 : list<int>)
{
  forall i :: countI(i,l1) == countI(i,l2)
}

/***** Q3(a) */
/* state the lemma saying that inserting an element into a list with the 
   'insert' function gives you a permutation of just putting the element
   onto the front of the list with Cons.

   The proof should be {}/automatic
*/
lemma insert_mseq(i:int, l:list<int>)
  ensures false // needs correcting!
{}

/***** Q3(b) */
/* state the lemma saying that if you have lists that are permutations of
   each other, then putting the same element on front of both (with Cons), 
   gives results that are permutations of each other.
   
   The proof should be {}/automatic */
lemma mseqLists_Cons(h:int, l1:list<int>, l2:list<int>)
  requires true // needs correcting!
  ensures false // needs correcting!
{}

/***** Q3(c) */
/* State and prove that insertionSort does the right thing. */
lemma insertionSort_correct(l:list<int>)
  ensures false  // result is permutation of input
  ensures false  // result is sorted
{
}


// membership (you've seen this before); needed for the next lemma 
predicate member(i:int, l:list<int>)
{
  match l case Nil => false
  case Cons(h,t) => h == i || member(i,t)
}
