/* What *must* we assign to?  What *mustn't* we assign to? */
method maxMinMethod(i : int, j : int) returns (mx : int, mn : int)
  /* parens required around returns, even if there's only one */
{
    if i < j { return j, i; }
    return i, j;
}

function maxAgain(i: int, j: int) : int {
    if i < j then j else i
}

method Main()
{
    // dafny is fussy here; can't put parens around x,n
    var max1 := maxMinMethod(3,10);
    var max2 := maxAgain(3,10);

    print "max is ", max1, "\n";
    print "max is ", max2, "\n";
}