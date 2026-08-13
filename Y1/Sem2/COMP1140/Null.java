void main() {
  int[] iarr = new int[10];
  boolean[] barr = new boolean[10];
  String[] sarr = new String[10];
  String s = null;

  try {
    int len = s.length();

  } catch (NullPointerException e) {
    IO.println("Null pointer! AAAAAH!");
    IO.println(e.getMessage());
  } catch (NumberFormatException e) {
    IO.println(e.getMessage());
  }
}
