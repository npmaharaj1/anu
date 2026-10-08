function sum(n: nat) : nat
{
    if n == 0 then 0 else n + sum(n-1)
}

method sumMd(n: nat) returns (s: nat)
    ensures s == sum(n)
{
    s := 0;
    var c : nat := 0;
    while c < n
        invariant c <= n
        invariant s == sum(c)
    {
        c := c + 1;
        s := s + c;
    }
}
