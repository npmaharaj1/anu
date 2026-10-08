method multBroken(m: int, n: int) returns (r: int)
    requires n >= 0
    ensures r == n * m
{
    var x := 0;
    // r := m // WRONG
    r := 0; // RIGHT
    while (x < n)
        invariant x <= n
        invariant r == x * m // loop invariant could not be proved initially
    {
        x := x + 1;
        r := r + m;
    }
}

method countUpBroken(n: nat) returns (x: int)
    ensures x == n
{
    x := 0;
    while (x < n)
        invariant x <= n // invariant should be <=, NOT <
    {
        x := x + 1;
    }
}

// repair 2

method upToBroken(n: int) returns (x: int)
    requires n >= 0
    ensures x == n
{
    x := 0;    
    while (x < n)
        invariant x <= n
    {
        x := x + 1;
    }
}