function withTax(cents : int) : int 
    requires cents >= 0 {
        var tax := cents / 10;
        cents + tax
}

method Main() {
    print "tax for 5c: ", withTax(5);
}