datatype list<T> = Nil | Cons(hd: T, tl: list<T>)
datatype option<T> = None | Some(T)
type lset = list<int>

function length<T>(l:list<T>) : nat { 
  match l case Nil => 0 case Cons(_,t) => 1 + length(t)
}
function append<T>(l1:list<T>,l2:list<T>) : list<T> {
  match l1 case Nil => l2 case Cons(h,t) => Cons(h, append(t, l2))
}
