include "../core-list.dfy"

// "dictionaries" are lists of integers (the keys), coupled 
// with the values, which can be anything (generic/polymorphic)
type dict<V> = list<(int,V)>

function lookup<V>(key:int, dict:dict<V>) : option<V>
{
    match dict 
    case Nil => None
    case Cons((j,v), rest) => if j == key then Some(v) 
                            else lookup(key,rest)
}

function insert<V>(key : int, value : V, dict : dict<V>) : dict<V>
{
  Cons((key,value), dict)
}

lemma lookup_insert<V>(d:dict<V>, k:int, v:V)
  ensures lookup(k,insert(k,v,d)) == Some(v) {}
