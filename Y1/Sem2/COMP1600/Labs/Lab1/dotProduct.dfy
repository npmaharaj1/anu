function dotProduct(u : (int, int), v : (int, int)) : int {
    u.0*v.0 + u.1*v.1
}

method Main() {
 print "dotProduct((3,4), (7,3)): ", dotProduct((3,4), (7,3));
}