include "../core-list.dfy"

predicate member(a : int, A : lset)
{
    match A case Nil => false
    case Cons(x,xs) => a == x || member(a,xs)
}

predicate subset(A : lset, B : lset) 
{
    match A 
    case Nil => true
    case Cons(x,xs) => member(x,B) && subset(xs,B)
}

lemma subset_member(x:int, A:lset, B:lset)
  requires member(x,A) requires subset(A,B)
  ensures member(x,B) {}

/* A ⊆ B ∧ B ⊆ C ⇒ A ⊆ C */
/* build  what-do-we-have   vs   what-do-want  table */
lemma subset_trans(A : lset, B : lset, C : lset)
  requires subset(A,B)
  requires subset(B,C)
  ensures subset(A,C) 
{}

/* A ⊆ A */
lemma subset_refl(A : lset)
  ensures subset(A,A)
{}
