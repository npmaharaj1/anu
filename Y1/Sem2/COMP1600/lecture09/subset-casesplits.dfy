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
/* build  what-do-we-have   vs   what-do-we-want  table */
// Structure of the proof matches the structure of the function
// Take tiem to document what you nkow and what you need to know when writing out proofs
lemma subset_trans(A : lset, B : lset, C : lset)
  requires subset(A,B)
  requires subset(B,C)
  ensures subset(A,C) 
{
  match A
    case Nil => {}
    case Cons(hd, tl) => { subset_member(hd, B, C); }
}

/*

  A     <=      A        =  [] ++ A
  A     <=     x:A       =  [x] ++ A
  A     <=    y:x:A      =  [y,x] ++ A
  A     <=   z:y:x:A     =  [z,y,x] ++ A


*/

// Reflexivity
// If A is empty, then we are proving Nil is subset of Nil. (Nil is subset of everything) => True
// If A contains values, then it is reflexive IFF x is a member of itself and xs is a member of itself (recursive)

lemma subset_append(A: lset, B: lset)
  ensures subset(A, append(B, A))
{
  match A
    case Nil => {}
    case Cons(x, xs) => {
      assert member(x, append(B, A));
      // assert subset(xs, append(B, A));
      assert subset(xs, append(B, Cons(x,xs))); // B ++ x:xs == (B ++ [x]) ++ xs
      assert subset(xs, append(append(B, Cons(x, Nil)), xs)); // xs <= (B ++ [x]) ++ xs
      assert append(B, Cons(x, xs)) == append(append(B, Cons(x, Nil)), xs);
    }
}

// lemma subset_bigger(x: int, xs: lset)
//   ensures subset(xs, Cons(x, xs))
// {
//   match xs
//     case Nil => {}
//     case Cons(y, ys) => { // xs == Cons(y, ys)
//       assert member(y, Cons(x, xs)); // y is definitely in Cons(y, ys)
//       assert subset(ys, Cons(x, Cons(y, ys)));
//     }
// }

/* A ⊆ A */
lemma subset_refl(A : lset)
  ensures subset(A,A)
{
  match A
    case Nil => {}
    case Cons(x, xs) => {
      assert subset(xs, Cons(x, xs)) by {

      }
    }
}