include "../core-list.dfy"

// OK
predicate member(i:int, s:lset) 
{
  match s
    case Nil => false
    case Cons(hd, tl) => i == hd || member(i, tl)
}

function insert(i:int, s:lset) : lset
{
  Cons(i, s) // Bad set (not a set lol)
}

function union (A : lset, B : lset) : lset
{
  append(A,B) // Union is the OR operator.
}

function delete(i:int, A : lset) : lset
{
  match A
    case Nil => Nil
    case Cons(hd, tl) =>
      var t' := delete(i, tl); // cool way of saving code time
      if hd == i then t' else Cons(hd, t')
}

function intersect(A : lset, B : lset) : lset // AND
{
  match A
    case Nil => Nil
    case Cons(hd, tl) =>
      var i0 := intersect(tl,B);
      if member(hd, B) then Cons(hd, i0) else i0
}

predicate subset(A : lset, B : lset)
{
  match A
    case Nil => true
    case Cons(hd, tl) => member(hd,B) && subset(tl, B)
}

function card(A: lset) : nat
{
  match A
    case Nil => 0
    case Cons(hd, tl) => if member(hd, tl) then card(tl) else 1 + card(tl)
}

lemma cardtest()
  ensures card(union(Cons(1, Cons(2, Cons(3, Nil))), Cons(3, Cons(4, Cons(5, Nil))))) == 5 {}

// work
lemma member_insert(x : int, y:int, A : lset) 
  ensures member(x, insert(y, A)) <==> member(x, A) || y==x {}

lemma member_delete(i:int, j:int, A:lset)
  ensures member(i, delete(j, A)) <==> i != j && member(i, A) {}

lemma member_inter(x:int, A:lset, B:lset)
  ensures member(x, intersect(A,B)) <==> member(x, A) && member(x, B) {}

lemma member_subset(x:int, A:lset, B:lset)
  requires subset(A, B)
  requires member(x, A)
  ensures member(x, B) {}

// feels like it should work
lemma member_union(x : int, A : lset, B : lset)
  ensures member(x, union(A,B)) <==> member(x, A) || member(x, B) {}

lemma subset_union(A : lset, B : lset, C : lset) 


lemma subset_refl(A : lset)


lemma subset_trans(A : lset, B : lset, C : lset)


