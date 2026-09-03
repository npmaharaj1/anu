include "../core-list.dfy"

lemma {:induction false} length_append<T>(l1:list<T>, l2:list<T>)
  ensures length(append(l1,l2)) == length(l1) + length(l2)

function reverse<T>(l:list<T>) : list<T>
{
    match l case Nil => Nil
    case Cons(h,t) => append(reverse(t), Cons(h, Nil))
}

lemma length_reverse<T>(l:list<T>)
  ensures length(reverse(l)) == length(l)
{
}