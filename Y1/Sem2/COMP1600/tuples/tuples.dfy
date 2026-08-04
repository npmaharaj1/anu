// Returns ones value
function f(x:int, y:int) : int {
    x + y
}

// Returns two values in one tuple
function swap_ish (x:int, y:int) : (int,int) {
    (y,x)
}

// Tuples can container two types
function two_type_swap(x:int, y:nat) : (int,nat) {
    (x, y)
}

method Main() {
    print "swap_ish: ", swap_ish(2,5), "\n";
    
    print "type_type_swap: ", two_type_swap(-3, 43), "\n";
}