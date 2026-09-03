include "../core-list.dfy"

function reverse<T>(l:list<T>) : list<T>
{
    match l case Nil => Nil
    case Cons(h,t) => append(reverse(t), Cons(h,Nil))
}

lemma length_append<T>(l1 : list<T>, l2:list<T>) 
  ensures length(append(l1,l2)) == length(l1) + length(l2) {}


datatype tree<V> = Lf | Node (k:int, v:V, tree<V>, tree<V>)

function size<V>(t : tree<V>) : nat
{
    match t case Lf => 0
    case Node(_, _, lt, rt) => size(lt) + size(rt) + 1
}

function mirror<V>(t:tree<V>) : tree<V>
{
    match t case Lf => Lf
    case Node(k,v,lt,rt) => Node(k,v,mirror(rt), mirror(lt))
}

function keys<V>(t:tree<V>) : list<int>
{
    match t case Lf => Nil
    case Node(k,_, lt, rt) => append(keys(lt), Cons(k, keys(rt)))
}

lemma {:induction false} size_mirror<V>(t:tree<V>) 
  ensures size(mirror(t)) == size(t) 

lemma {:induction false} length_keys<V>(t:tree<V>)
  ensures length(keys(t)) == size(t) 
