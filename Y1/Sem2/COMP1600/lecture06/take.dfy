datatype list<T> = Nil | Cons(hd: T, tl: list<T>)

// take with signature:
function take<T> (n:nat, l : list<T>) : list<T>
{
  match (l, n)
    case (l, 0) => l
    case (Nil, _) => Nil
    case (Cons(hd, tl), n) => take((n-1), tl)
}


// and what's the right lemma to prove about the 
// length of take(n,l) ?


// take + append: 
// - take n elements from an append

// take equals Nil when?
//lemma take_equals_nil<T>(n: nat, l: list<T>)
//  ensures take(n, l) == Nil <==> l.Nil? || n == 0 {}
