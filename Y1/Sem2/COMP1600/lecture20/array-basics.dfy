method baasics() {
    var a: array<int> := new int[20];
    a[0] := 12;
    var a0 : int := 12;
    a[12] := 12;
    assert a.Length == 20;
    assert a[0] == 12;

    var n := a.Length;
    /* in place: no new array is made */
    a[0] := 17;
    assert a[0] == 17;
    
    /* a is a collection of 20 new variables,
    each a[i] behaves just like a variable you might declare with something like
        var a12 : int := 12; */
}

method mk()  returns (a: array<int>)
    ensures a.Length == 20
    ensures a[12] == 12
    ensures forall i| 0 <= i < 20 && i != 12 :: a[i] == 0
{
    a := new int[20];
    var i := 0;
    while i < a.Length
        invariant i <= a.Length
        invariant forall j:nat | j < i :: a[j] == 0
    {
        a [i] := 0;
        i := i +  1;
    }
    assert forall j : nat | j < a.Length :: a[j] == 0;
    a[12] := 12;
}

function array_fn(a: array<int>, b: array<int>): array<int>
    requires a.Length > 0
    reads a
{
    if a[0] % 2 == 0 then a else b
}

predicate arrays_eq(a: array<int>, b: array<int>)
{
    if a == b then true else false
}

predicate sorted(a: seq<int>)
{
    forall i: nat, j: nat | j < i < |a| :: a[j] <= a[i]
}

method foo(a: array<int>) returns (ai: int)
{
    if sorted(a[..]) { return 3;}
    else {return 4;}
}