include "../core-list.dfy"

function take<T>(n: nat, l:list<T>) : list<T>
{
  match l
    case Nil => Nil
    case Cons(hd, tl) => if n == 0 then Nil else Cons(hd, take(n-1, tl))
}

function drop<T>(n: nat, l:list<T>) : list<T>
{
  match l
    case Nil => Nil
    case Cons(hd, tl) => if n == 0 then l else drop(n-1, tl)
}

function chunks<T>(n: nat, l: list<T>) : list<list<T>>
  requires 0 < n
  decreases length(l)
{
  match l
    case Nil => Nil
    case _ => Cons(take(n,l),chunks(n,drop(n,l))) // Cannot terminate (needs method)
}
