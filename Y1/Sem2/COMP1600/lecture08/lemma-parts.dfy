// let's mess with the component parts of the following
//   - add a return type?
//   - add requires; add ensures
//   - remove requires ; remove ensures
//   - remove/add parameters
lemma simple(m:nat, n:nat)
  requires m <= n
  ensures 2 * m <= 2 * n 
{}

