// Precondition: requires
// Postcondition: ensures

function makeItBigger(i:int) : int 
    ensures makeItBigger(i) > i {
            i + 1
    }
    
datatype point = Point(x:int, y:int)

// Requires is a constraint on the caller.
// Can't call if pre-condition is not met
function gradient(p1:point, p2:point):int
    requires p2.x > p1.x {
        // Rise over run
        (p2.y - p1.y)/(p2.x - p1.x)
    }
    
// eg.
function makeItSmaller(i:int) : int
    ensures makeItSmaller(i) < i {
        i - 1
    }
    
function makeItSmallerNat(i:nat) : nat
    ensures makeItSmallerNat(i) > 0 && makeItSmallerNat(i) < i {
        i - 1
    }