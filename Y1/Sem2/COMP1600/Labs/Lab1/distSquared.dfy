function distSquared(v : (int, int)) : int {
    v.0 * v.0 + v.1 * v.1
}

lemma testDistSquared()
    requires distSquared((3,4)) == 25 {}