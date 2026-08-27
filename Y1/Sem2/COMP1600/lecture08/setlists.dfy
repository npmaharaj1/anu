include "../core-list.dfy"

// OK
predicate member(i:int, A:lset) 
{
    match A case Nil => false case Cons(j,rest) => i == j || member(i,rest)
}
function union (A : lset, B : lset) : lset 
{
    append(A,B)
}


// union was defined in terms of append. We can prove append and call to prove
lemma member_union(x : int, A : lset, B : lset)
  ensures member(x,union(A,B)) <==> member(x,A) || member(x,B)
{
    member_append(x, A, B);
}

lemma member_append(x: int, A: lset, B: lset)
    ensures member(x, append(A, B)) <==> member(x, A) || member(x, B)
{

}