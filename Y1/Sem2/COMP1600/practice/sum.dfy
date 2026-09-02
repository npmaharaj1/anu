function sum(n: nat) : nat
    decreases n
{
    match n
        case 0 => 1
        case _ => 1 + sum(n-1)
}

lemma sumNonNegative(n: nat)
    ensures sum(n) >= 0
{
    
}

function factorial(n: nat) : nat
{
    match n
        case 0 => 1
        case 1 => n
        case _ => n * factorial(n-1)
}

function power(x: nat, n: nat) : nat
{
    
}