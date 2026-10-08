## The Big Idea
Loop invariant is the inductive hypothesis for a loop

In Lecture 13:
* The steps of an induction are easy; finding the statement is hard.
* Strengthening the I.H. means adding a <b>parameter</b>

In a loop:
* Checking an invariant is easy; finidng one is hard
* strengthening an invariant means adding a conjunct

## Accumulators
### They were loop variables all alone
```dafny
function f(..., acc : t) : ... {
    ...
    f(..., different-acc)
}
```

is the same as

```dafny
while ... {
    ...
    acc := different-acc;
}
```

Therefore:
* (invariant I AND NOT(guard))
* Is the invariant true, Does it stay true as the loop continues, Does it give you what you need at the end? (above)
* Does NOT(guard) -> final assertion

troubleshooting:
* If cross in Q1: invariant too strong
* if cross in Q2: invaraint is wrong
* If cross in Q3: invariant is too weak

### Take guard and wack it as an invariant.
### Make sure to change the final case to step case tho...