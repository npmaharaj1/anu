/* ============================================================
   COMP1600 / COMP6260  Foundations of Computing
   Lab 1  (Week 2) -- Functional Dafny Basics
   ============================================================

   HOW TO USE THIS FILE
   --------------------
   Open this file in VS Code with the Dafny extension running.

   Dafny checks the whole file continuously. Most exercises leave a
   function without a body for you to write; some ask you to add a
   specification (a "requires" or "ensures" line). An unfinished or
   incorrect definition shows a red squiggle and a message in the
   Problems pane. YOUR JOB is to fill every hole so the file is
   error-free: every function defined, every claim checked by Dafny.

   Parts A, B and C use only material from the first three lectures,
   which you have all seen. Get these solid first.

   Part D is a GENTLE first look at Lecture 4 (recursive types). If
   your lab is early in the week you may not have met this in lectures
   yet -- that is fine. The first function is written out for you, and your
   tutors are here to teach and help. Treat it as a warm-up, not a test.

   There may be more exercises here than you can finish in 90--120 minutes.
   Items marked (*) are stretch goals. Get as far as you can; the rest
   is good practice in your own time.

   Ask questions early and often.
   ============================================================
*/


/* ------------------------------------------------------------
   PART A -- Expressions, functions and types   (Lecture 2)
   ------------------------------------------------------------ */

// Exercise 1.
// A 2D vector is a pair of ints. distSquared should return the
// square of the vector's length, i.e. x*x + y*y  (no sqrt: that
// would need real numbers). Give it a body.
// Reminder: for a pair v, the components are v.0 and v.1 .
function distSquared(v : (int,int)) : int {
  v.0 * v.0 + v.1 * v.1
}


// Exercise 2.
// The dot product of (u0,u1) and (v0,v1) is  u0*v0 + u1*v1 .
function dotProduct(u : (int, int), v : (int, int)) : int {
    u.0*v.0 + u.1*v.1
}

// Two vectors are perpendicular exactly when their dot product is
// zero. Write perpendicular as a PREDICATE (returns bool), using
// dotProduct.
predicate perpendicular(u : (int,int), v : (int,int)) {
    u.0*v.0 + u.1*v.1 == 0
}

// Exercise 3.
// "m divides n" is true when n is a multiple of m. We treat 0 as
// dividing only 0. So divides(m,n) is true when either
//   - m and n are both 0, OR
//   - m is not 0 and n leaves remainder 0 when divided by m.
// Use  %  (modulus),  &&  (and),  ||  (or).

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


// Exercise 4.
// inRange(lo, x, hi) is true exactly when x lies between lo and hi
// inclusive. Dafny lets you write a CHAINED comparison
//   lo <= x <= hi
// which means  lo <= x && x <= hi .
predicate inRange(lo : int, x : int, hi : int) {
    lo <= x && x <= hi
}

// Exercise 5.
// A "let"-style local binding uses  var name := expr;  before the
// result expression (like Haskell's let/where). withTax adds 10%
// tax: bind  tax  to  cents / 10  and then return cents + tax.
function withTax(cents : int) : int 
    requires cents >= 0 {
        var tax := cents / 10;
        cents + tax
}

lemma testDistSquared()
  ensures distSquared((3,4)) == 25 {}
lemma testDotProduct()
  ensures dotProduct((4,5), (8,9)) == 77 {}
lemma testPerpendicular()
  ensures perpendicular((4,5), (8,9)) == false
  ensures perpendicular((2,4), (8, -4)) == true {}
lemma testDivides()
  ensures divides(4,12) == true
  ensures divides(13,4) == false {}
lemma testInRange()
  ensures inRange(0, 4, 10) == true
  ensures inRange(0, 0, 10) == true
  ensures inRange(0, -1, 10) == false {}


/* ------------------------------------------------------------
   PART B -- Datatypes and pattern-matching   (Lecture 3)
   ------------------------------------------------------------ */

// A traffic light is one of three things:
datatype light = Red | Orange | Green

// Exercise 6.
// Complete  next , the light that follows the given one in the usual
// cycle  Red -> Green -> Orange -> Red . Use a  match  with one case
// per constructor.
function next(l : light) : light {
  match l
    case Red => Green
    case Green => Orange
    case Orange => Red
}

// Exercise 7.
// A shape carries some data with each constructor.
datatype shape =
    Rectangle(height : nat, width : nat)
  | Square(side : nat)
  | Triangle(base : nat, height : nat)

// area returns:  Rectangle -> height*width ,  Square -> side*side ,
// Triangle -> base*height/2 . Pattern-match and use the fields.
function area(s : shape) : nat {
  match s
    case Rectangle(height, width) => height*width
    case Square(side) => side * side
    case Triangle(base, height) => (base * height) / 2
}


// Exercise 8.
// Months, and how many days each has -- the leap-year aware version:
// February has 29 days when  isLeap  is true, otherwise 28.
datatype month =
  Jan | Feb | Mar | Apr | May | Jun |
  Jul | Aug | Sep | Oct | Nov | Dec

// Complete monthLen. You can group cases that share a result:
//   case Jan | Mar | May | ... => 31
// and you will need an  if  for February.
function monthLen(m : month, isLeap : bool) : nat {
  match m
    case Sep | Apr | Jun | Nov => 30
    case Jan | Mar | May | Jul | Aug | Oct | Dec => 31
    case Feb => if isLeap then 29 else 28
}

// And now calculate when a year is a leap year:
//   - write a function with appropriate type
//   - if year number is divisible by four, it's probably a leap year
//   - but if it's a century year, it's not a leap year
//   - UNLESS, if it's divisible by 400, then it is a leap year after all
// IOW, 2024 was a leap year, 1900 wasn't, 2000 was.
predicate isLeapYear(year : nat) {
  if (year % 4 == 0) then
    if (year % 100 == 0) then
      if (year % 400 == 0) then
        true
      else
        false
    else
      true
  else
    false
}

// write testing lemmas for the test cases in the comment above
lemma testNext()
  ensures next(Red) == Green
  ensures next(Green) == Orange
  ensures next(Orange) == Red {}
  
lemma testArea()
  ensures area(Rectangle(3, 2)) == 6
  ensures area(Square(4)) == 16
  ensures area(Triangle(5, 8)) == 20 {}
  
lemma testMonthLen()
  ensures monthLen(Apr, true) == 30
  ensures monthLen(Feb, true) == 29
  ensures monthLen(Feb, false) == 28 {}

lemma testisLeapYear()
  ensures isLeapYear(2024) == true
  ensures isLeapYear(1900) == false
  ensures isLeapYear(2000) == true {}


/* ------------------------------------------------------------
   PART C -- Recursion, and simple specifications
                                          (Lectures 2 & 3)
   ------------------------------------------------------------ */

// Exercise 9.
// Recursion over the natural numbers. exp(m,p) computes m to the
// power p, remembering  m^0 = 1  and  m^(p+1) = m * m^p .
// Recurse on p.
function exp(m : nat, p : nat) : nat {
  if (p == 0) then
    1
  else
    m * exp(m, (p-1))
}


// Exercise 10.
// gradient is "rise over run". The body is already correct, but as
// written Dafny complains: the division could be by zero. Add a
//   requires ...
// line (a PRECONDITION) that rules out the bad case, so the squiggle
// on the division disappears.
function gradient(p1 : (int,int), p2 : (int,int)) : int
  requires (p2.0 - p1.0) != 0
{
  (p2.1 - p1.1) / (p2.0 - p1.0)
}

// Exercise 11.
// Here the specification is given as an  ensures  (a POSTCONDITION):
// makeItBigger must return something strictly larger than its input.
// Give a body that satisfies it. (Many answers work.)
function makeItBigger(i : int) : int
  ensures makeItBigger(i) > i {
    i + 1
}

// Exercise 12.
// factorial is given. A "testing lemma" states a fact about a
// function and asks Dafny to check it; an empty body  {}  means
// "this should be obvious, Dafny". Write the ensures clauses below so
// each lemma claims the stated fact, then check the empty bodies pass.
// (There is nothing red to fix until you have written the ensures.)
function fact(n : nat) : nat
{
  if n < 2 then 1 else n * fact(n - 1)
}

lemma testExp()
  ensures exp(2,7) == 128
  ensures exp(5,4) == 625 {}

lemma testGradient()
  ensures gradient((0, 0), (4,4)) == 1 {}

lemma testMakeItBigger()
  ensures makeItBigger(5) > 5
  ensures makeItBigger(8) > 8 {}

// Claim: fact(4) equals 24.
lemma factTest1()
  ensures fact(4) == 24
{}

// Claim: fact(6) is greater than 100.
lemma factTest2()
  ensures fact(6) > 100
{}


/* ------------------------------------------------------------
   PART D -- A gentle first look at recursive types
                                                 (Lecture 4)
   ------------------------------------------------------------
   New material. If you have not had Lecture 4 yet, do not worry --
   read the worked example, ask your tutor, and give the rest a try.
   ------------------------------------------------------------ */

// A polymorphic list: either empty (Nil), or a head element followed
// by another list (Cons).
datatype list<T> = Nil | Cons(hd : T, tl : list<T>)

// WORKED EXAMPLE -- nothing to do here, just read and understand.
// length counts the elements of a list. A list is either Nil (which
// has length 0), or Cons(head, tail) whose length is 1 plus the
// length of the tail. We recurse on the structure of the list.
function length<T>(l : list<T>) : nat
{
  match l
  case Nil => 0
  case Cons(_, xs) => 1 + length(xs)
}

// Exercise 13.
// Following exactly the shape of length above, complete append, which
// puts l1 in front of l2:
//   - if l1 is Nil, the answer is just l2;
//   - if l1 is Cons(x, xs), the answer is Cons(x, <append of xs, l2>).
function append<T>(l1 : list<T>, l2 : list<T>) : list<T> {
  match l1
    case Nil => l2
    case Cons(x, xs) => Cons(x, append(xs, l2))
}
// TODO: give a body, following the pattern of length above


// Exercise 14.
// member(x, A) is true when x appears somewhere in the list A:
//   - Nil contains nothing;
//   - Cons(y, ys) contains x when  x == y , or when x is somewhere in ys.
function member(x : int, A : list<int>) : bool {
  match A
    case Nil => false
    case Cons(y, ys) => x == y || member(x, ys)
}


// Exercise 15.  (*) stretch -- only if you have time.
// A binary tree carrying a string key and a value of type V at each
// internal (Node) node; Lf is an empty leaf.
datatype tree<V> = Lf | Node(key : string, val : V, left : tree<V>, right : tree<V>)

// size counts the internal (Node) nodes. A Lf has size 0; a Node has
// size 1 plus the sizes of its two subtrees. Recurse, like length.
function size<V>(t : tree<V>) : nat {
  match t
    case Lf => 0
    case Node(_, _, left, right) => 1 + size(left) + size(right)
}

// ============================================================
// End of Lab 1. If everything is green, well done!
// ============================================================