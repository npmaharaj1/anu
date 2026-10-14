method aliasing()
{
    var a : array<int> := new int[20];
    a[0] := 12;
    var b : array<int> := a;
    assert b[0] == 12;
    a[0] := 17;
    assert b[0] == 17;
    b[1] := 3;
    assert a[1] == 3;
}

method equality()
{
    var a := new int[3]; a[0], a[1], a[2] := 0, 1, 10;
    var b := new int[3]; b[0], b[1], b[2] := 0, 1, 10;
    assert a != b;                         // same constants, different references
    assert a[..] == b[..];
    b[2] := 11;
    assert a[..2] == b[..2];
    assert b[..] == [0, 1, 11];
    assert b[..][2 := 10] == a[..]; // Updates b
    b := a;
    assert a == b;
    a[0] := 17;
    assert b[0] == 17;
    b[1] := 4;
    assert a[1] == 4;
}

// method 