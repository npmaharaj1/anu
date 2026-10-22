method nuke0(a: array<int>) returns (i: int)
    requires a.Length > 0
    modifies a // modifies required (not dafny required)
{
    a[0] := 3;
    i := 0;
    if a.Length > 1 {i := a[i];}
}

method nuke1(a: array<int>, b: array<int>)
    requires a.Length > 1 && b.Length > 1
    requires b[1] != 10
    modifies a
{
    if a == b {
        b[1] := 0;
        // important consequences
        assert a == b;
        assert a[1] == 0;
    } else {
        if a[0] != b[0] && a.Length == 1 && b.Length == 1
        {
            a[0] := b[0];

            // yet a is still not the same array as b
            assert a != b;

            // They have the same sequence of values;
            assert a[..] == b[..];
        }
    }
    
    var c : array<int> := new int[20];
    c[1] := 42;
    c := b;
    // c[0] := 7; // attempts to change b
}