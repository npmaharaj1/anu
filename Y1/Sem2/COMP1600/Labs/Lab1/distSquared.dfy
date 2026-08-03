function distSquared(v : (int, int)) : int {
    v.0 * v.0 + v.1 * v.1
}

method Main() {
    print "distSquared((4,8)); ", distSquared((4,8));
}