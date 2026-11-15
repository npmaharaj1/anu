/* SAMPLE FINAL EXAM 2026: Question 1.

   10 marks in total

   All students to answer all questions.

   Replace /* YOUR WORK GOES HERE */ comments with your
   work.  Leave everything else untouched.

   Remember that when asked to prove a lemma, you need to
   have a proof; sometimes {} will be enough, sometimes not,
   but remember to always include the {}!
*/

datatype tree = Leaf | Node(left: tree, val: int, right: tree)

/* 1A.
   Define the function size, which returns the number of Nodes
   in a tree (Leaf has size 0).

   1 mark
*/
function size(t : tree) : nat
{
   match t
      case Leaf => 0
      case Node(l, _, r) => 1 + size(l) + size (r)
}

/* 1B.
   Define the function mirror, which returns the left-right mirror
   image of a tree: at every Node, the left and right subtrees are
   swapped (and are themselves mirrored).

   1 mark
*/
function mirror(t : tree) : tree
{
   match t
      case Node(l, v, r) => Node(mirror(r), v, mirror(l))
      case Leaf => Leaf
}

/* 1C.
   State and prove the testing lemma saying that mirroring the
   tree with 2 at the root, a Leaf on its right, and on its left
   a Node containing 1 (with two Leaf children), gives the tree
   with 2 at the root, a Leaf on its left, and the Node containing
   1 on its right.

   1 mark
*/
lemma mirror_example()
   ensures mirror(Node(Node(Leaf, 1, Leaf), 2, Leaf)) == Node(Leaf , 2, Node(Leaf, 1, Leaf))
{}

/* 1D.
   State and prove that mirroring a tree twice gives back the
   original tree.

   2 marks
*/
lemma mirror_mirror(t : tree)
   ensures mirror(mirror(t)) == t
{}

/* 1E.
   Define the predicate contains, which is true exactly when the
   integer x occurs as the val of some Node in t.

   1 mark
*/
predicate contains(x : int, t : tree)
{
   match t
      case Leaf => false
      case Node(l, v, r) => x == v || contains(x, l) || contains(x, r)
}

/* 1F.
   State and prove that x is contained in the mirror of t if and
   only if x is contained in t.

   2 marks
*/

lemma ContainsMirror(t: tree, x: int)
  ensures contains(x, mirror(t)) <==> contains(x, t)
{}

/* 1G.
   State and prove that every tree with a non-zero size contains
   some integer.  (Your statement should use an existential
   quantifier.)

   2 marks
*/
lemma nonempty_contains(t : tree)
   requires t != Leaf
   ensures exists n:int :: contains(n, t)
{
   match t
      case Leaf =>
      case Node(l, v, r) => assert contains(v, t);
}