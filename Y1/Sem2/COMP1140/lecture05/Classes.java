class Person {
  int age;
  String name;

  void printDescription() {
    IO.println(name + " (Age "+age+")"); // +var+ to inline read vars
  }
}

void main() {
  Person p1 = new Person();
  Person p2 = new Person();

  p1.age = 5;
  p1.name = "Tom";

  p2.age = 19;
  p2.name = "fits";

  IO.println(p1.name);
  p1.printDescription();
  p2.printDescription();
}
