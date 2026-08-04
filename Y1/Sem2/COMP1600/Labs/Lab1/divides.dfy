// function divides(m : nat, n : nat) : bool {
//     if (m == 0 && n == 0) then
//         true
//     else if ((m != 0) && (n % m == 0)) then
//         true
//     else false
// }

predicate divides(m : nat, n : nat) {
    (m == 0 && n == 0) || ((m != 0) && (n % m == 0))
}

method Main() {

}