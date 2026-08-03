// Recursive type is one whose definition is expressed recursively
// eg. a list is either empty or has a head element, followed by a sub-list

// example list
datatype intlist = Empty | Cons(hd: int, tl: intlist) // head and sub-list as tail (remainder)

function foo() : int
    ensures foo() == 0 {
        var l:= Cons(0, Cons(1, Cons(2, Empty))); // [0,1,2]
        l.hd
}