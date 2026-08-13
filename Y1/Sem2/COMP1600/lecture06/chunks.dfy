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

