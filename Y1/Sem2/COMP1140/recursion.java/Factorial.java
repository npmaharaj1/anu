/**
 * @param n a natural number >= 0
 * */
int fact(int n) {
  if (n >= 0) {
    switch (n) {
      case 0:
      return 1;
      case 1:
      return n;
      default:
      return n * fact(n-1);
    }
  }
  return 0;
}

void main() {
  IO.println("fact(-1) = " + fact(-1));
  IO.println("fact(1) = " + fact(1));
  IO.println("fact(0) = " + fact(0));
  IO.println("fact(5) = " + fact(5));
}
