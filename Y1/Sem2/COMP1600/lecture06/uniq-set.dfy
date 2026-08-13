include "../core-list.dfy"

predicate member(x : int, A : lset)
{
    match A 
    case Nil => false
    case Cons(y,ys) => x == y || member(x,ys)
}

predicate wfSet( A : lset) // Wellformed set prevents duplicates in lists (sets)
{
    match A
    case Nil => true
    case Cons(x,xs) => !member(x,xs) && wfSet(xs) // Recursively ensures no dups
}

/* functions to define
insert
delete
inter
union
card
subset
*/

function insert(x:int, A:lset) : lset
{
  if !member(x, A) then Cons(x, A) else A
}

lemma insert_preserves_wfSet(x:int, A:lset)
  requires wfSet(A)
  ensures wfSet(insert(x,A)) {}

lemma member_insert(x:int, y:int, A:lset)
  ensures member(x,insert(y,A)) <==> x == y || member(x,A) {}

/* lemmas to prove

+ whatever well-formedness results we need and can manage
*/


function delete(x:int, A : lset) : lset
{
  match A
    case Nil => Nil
    case Cons(hd, tl) => if hd == x then tl else Cons(hd, delete(x, tl))
}

lemma member_delete(x:int, y:int, A : lset) 
  requires wfSet(A) // Assume set is well formed (no duplicates)
  ensures member(x,delete(y,A)) <==> x != y && member(x,A) {}

//lemma wfSet_delete(x:int, A:lset) 
//  ensures wfSet(delete(x,A)) {}


function inter(A:lset, B:lset) : lset
{
  match A
    case Nil => Nil
    case Cons(hd, tl) => var r0 := inter(tl, B);
      if member(hd,B)  then Cons(hd, r0) else r0
}

lemma member_inter(x:int, A : lset, B : lset)
  ensures member(x,inter(A,B)) <==> member(x,A) && member(x,B) {}

//lemma wfSet_inter(A:lset, B:lset)
//  requires wfSet(A) requires wfSet(B)
//  ensures wfSet(inter(A,B)) {}

predicate subset(A: lset, B : lset)
{
  match A
    case Nil => true
    case Cons(hd, tl) => member(hd,B) && subset(tl,B)
}

lemma member_subset(x:int, A : lset, B : lset)
  requires member(x,A) requires subset(A,B)
  ensures member(x,B) {}

function union(A:lset, B:lset): lset
{
  match A
    case Nil => B
    case Cons(hd, tl) => if member(hd, B) then union(tl, B) else Cons(hd, union(tl, B))
}

lemma member_union(x:int, A:lset, B:lset)
  ensures member(x,union(A,B)) <==> member(x,A) || member(x,B) {}

//lemma wfSet_union(A:lset, B:lset)
//  requires wfSet(A) requires wfSet(B)
//  ensures wfSet(union(A,B)) {}

function card(A:lset) : nat { length(A) }
