// Recursion Over arrays
// Polymorphism
datatype list1<T> = Single(T) | Cons1(hd: T, tl:list1<T>)
datatype list<T> = Nil | Cons(hd: T, tl: list<T>)

function length<T>(l: list<T>) : nat {
  match l
    case Nil => 0
    case Cons(_, tl) => 1 + length(tl)
}

function max(i: int, j: int) : int
{
  if i < j then j else i
}

function maxElem(l: list<int>) : int
  requires length(l) > 0
{
  match l
    case Cons(hd, Nil) => hd
    case Cons(hd, tl) => max(hd, maxElem(tl))
}

function maxListA(l: list<int>, acc: int) : int
{
  match l
    case Cons(_, Nil) => acc
    case Nil => acc
    case Cons(hd, Cons(hd1, tl)) => if hd > hd1 then maxListA(tl, hd) else maxListA(tl, acc)
}

// Recursion over trees
datatype tree<V> = Lf | Node(k: string, v: V, left: tree<V>, right: tree<V>)
datatype option<V> = None | Some(V)

function lookup<V>(t: tree<V>, key: string) : option<V>
{
  match t
    case Lf => None
    case Node(j, v, lt, rt) =>
      if j == key then Some(v)
        else if j < key then lookup(rt, key)
        else lookup(lt, key)
}

function size<T>(t:tree<T>) : nat
{
  match t
    case Lf => 0
    case Node(_, _, lt, rt) => 1 + size(lt) + size(rt)
}
