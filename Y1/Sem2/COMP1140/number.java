void main() {
  int x;
  int y;

  try {
    x = Integer.parseInt(IO.readln("Enter the first number: "));
    y = Integer.parseInt(IO.readln("Enter the second number: "));
    IO.println(x + " * " + y + " = " + (x*y));
  } catch (NumberFormatException e) {
    IO.println("Not a number! Goodbye.");
  } finally {
    IO.println("All done!");
  }
  IO.println("Done");

}
