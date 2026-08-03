predicate perpendicular(u : (int,int), v : (int,int)) {
    u.0*v.0 + u.1*v.1 == 0
}

method Main() {
    print "perpendicular: ", perpendicular((1432, -6000000013), (14, 0));
}