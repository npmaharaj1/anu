include "../core-list.dfy"

function reverse<T>(l: list<T>) : list<T>
{ // O(n^2) - yuck
  match l
    case Nil => Nil
    case Cons(h, t) => append(reverse(t), Cons(h, Nil))
}

lemma rev123()
  ensures reverse(Cons(1, Cons(2, Cons(3, Nil)))) == Cons(3, Cons(2, Cons(1, Nil))) {}

lemma length_reverse<T>(l: list<T>)
  ensures length(reverse(l)) == length(l) {} // See later why this fails
