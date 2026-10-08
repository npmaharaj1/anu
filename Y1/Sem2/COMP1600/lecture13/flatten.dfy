include "../core-list.dfy"

function keys<V>(t: tree<V>) : list<int>
{
    match t
        case Lf => Nil
        case Node(k, _, lt, rt) => append(keys(lt), Cons(keys(rt)))
}
