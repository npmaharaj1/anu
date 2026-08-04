function fact(n:nat) : nat {
    if n < 2 then 1 else n * fact(n-1)
}

lemma fact6()
    ensures fact(6) == 720 {}

/* Too big
lemma fact20()
    ensures fact(20) == 2432902008176640000 {}
*/