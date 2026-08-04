function factorial(x:nat) : nat {
    if x <= 1 then 
        x
    else
        x * factorial (x-1)
}

method Main() {
    print "Factorial of 5: ", factorial(5), "\n";
}