include "../core-list.dfy"

function max(a: int, b: int) : int
{
    if a > b then a else b
}

function maxA(l: list<int>, maxSoFar: int) : int
{
    match l
        case Nil => maxSoFar
        case Cons(j, js) => maxA(js, max(j, maxSoFar))

}

function maxList(l: list<int>) : int
    requires l.Cons?
{
    match l
        case Cons(j, Nil) => j
        case Cons(j, js) => max(j, max(j, maxList(js)))
}

function maxList2(l: list<int>): int
    requires l.Cons?
{
    match l
        case Cons(j, js) => maxA(js, j)
}

lemma maxA_thm(l: list<int>, A: int)
    ensures maxA(l, A) == if l.Nil? then A else max(maxList(l), A)
{}

lemma finishing_up(l: list<int>)
    requires l.Cons?
    ensures maxList(l) == maxList2(l)
{
    // match l
    //     case Cons(j, Nil) => {}
    //     case Cons(j, js) => maxA_thm(js, j);
    
    maxA_thm(l.tl, l.hd);
    assert (maxA(l.tl, l.hd) == 
            match l.tl
                case Nil => l.hd
                case Cons(j, js) => max(maxList(l.tl), l.hd));
}