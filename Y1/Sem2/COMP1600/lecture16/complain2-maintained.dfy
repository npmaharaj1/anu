// As many invariants as there are variables

function ffn(n: nat) : nat
{
    if n <= 1 then 1 else ffn(n-2) + ffn(n-1)
}

// ex 1
method fibBroken(n0: nat) returns (f0: nat)
    ensures f0 == ffn(n0)
{
    var f1, n := 1, 0;
    f0 := 1;
    while (n < n0)
        invariant n <= n0
        invariant f0 == ffn(n)
        invariant f1 == ffn(n+1)
    {
        var oldf1 := f1;
        f0, f1, n := f1, f0 + f1, n+1;        
        assert f0 == oldf1;
    }
    assert n == n0;
}




method multBroken(m: int, n: int) returns (r: int)
    requires n >= 0
    ensures r == n*m
{
    var x := 0;
    r := 0;
    while (x < n)
        invariant x <= n
        invariant r == x * m
    {
        x := x + 1;
        r := r + m;
    }
}