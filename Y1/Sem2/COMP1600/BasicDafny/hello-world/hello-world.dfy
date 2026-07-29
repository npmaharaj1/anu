method Main() {
    print "Hello, World!\n";
    print "3 + 2 * 10 = ", (3+2*10), "\n";
    
    print "SquareAndAddOne(): ", SquareAndAddOne(4), "\n";
    
    print "abs_diff (4, 6) -> ", abs_diff(4, 6), "\n";
    
    print "expanded(100) = ", expanded(100), "\n";
    print "predicate: ", predicate1(300); // returns true
}

// Stateful programming is programming something that can change
// eg. Array's, Integers have state
// eg. Functions do not have state 


// No returns for functions
function SquareAndAddOne(x : int) : int
{
    x * x + 1
}

// Note, expressions (functions) do not use semi-colons. Statements do.

function abs_diff(i : int, j : int) : int {
    if (i > j) then (i - j) else (j - i)
}

function expanded(x:int) : int {
    var y := x * 10;
    if y > 63 then y + 7 else y + 1
}

predicate predicate1(x:int) {
    x % 4 < (x+1) % 4
}