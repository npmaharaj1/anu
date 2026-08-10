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
    requires i > 1
    ensures makeItSmallerNat(i) > 0 && makeItSmallerNat(i) < i {
        i - 1
    }

// Logic further
// Syntax is the structure of the language
// Semantics is the meaning of the language conveyed
// Terms are the things we are talking abou
//  In dafny; terms can include variables and functions and expressions
//  Formulas: claim or assertions about terms using predicates

// Defining Predicates
function equalMod(x:int, y:int, z:int) : bool
  requires z != 0
{
  x % z == y % z
}

lemma equalMod_relfexive(x:int, z:int)
  requires z != 0
  ensures equalMod(x, x, z) {}

lemma equalMod_symmetric(x:int, y:int, z:int) 
  requires z!= 0
  requires equalMod(x,y,z)
  ensures equalMod(y,x,z) {}

lemma equalMod_trans(w:int, x:int, y:int, z:int)
  requires z != 0
  requires equalMod(w,x,z)
  requires equalMod(x,y,z)
  ensures equalMod(x,y,z) {}
