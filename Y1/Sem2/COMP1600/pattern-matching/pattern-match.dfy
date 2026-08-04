datatype Month = January | Febuary | March | April | May | June | July | August | September | October | November | December

function monthLen(m:Month) : nat {
    match m
    case April | June | September | November => 30
    case January | March | May | July | August | October | December => 31
    case Febuary => 28
    
}

method Main() {
    print "How many days in Jan: ", monthLen(January), "\n";
    print "How many days in Feb: ", monthLen(Febuary), "\n";
    print "How many days in Nov: ", monthLen(November), "\n";
}