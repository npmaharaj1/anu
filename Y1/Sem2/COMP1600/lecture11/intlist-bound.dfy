include "../core-list.dfy"

predicate exceeds(i:int, l:list<int>) {
  match l case Nil => true
  case Cons(h,t) => i > h && exceeds(i,t)
}

// will probably need an intermediate lemma

function max(i: int, j:int) : int {if i < j then j else i}

function maxList(l: list<int>) : int
  requires 0 < length(l)
{
  match l
    case Nil => j
    case Cons(j, js) => if (max(j, maxList(js)))
}

lemma maxList_exceeds(l: list<int>)
  requires 0 < length(l)
  ensures exceeds(maxList(l) + 1, l)
{
  match l
    case Cons(j, Nil) => {}
    case Cons(j, Nil) => {}
    case Cons(j, js) => {
      assert maxList(l) == max(j, maxList(js));
      assert exceeds(maxList(js) + 1, js);
      assert maxList(l) + 1 > j;
      assert exceeds(maxList(l) + 1, js);
    }
}

lemma boundExists(l : list<int>)
  ensures exists m :: exceeds(m,l)
{
  match l
    case Nil => {assert exceeds(10, l);}
    case Cons(j, js) => {
      maxlist_exceeds(l);
      assert exceeds(maxList(l) + 1, l);
    }

    }
}

// flip quantifiers, prove something else
