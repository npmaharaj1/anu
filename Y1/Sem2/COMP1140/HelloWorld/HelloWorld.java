void main() {
    String answer = IO.readln("This is a question: ");

    if (answer.toLowerCase().equals("yes")) {
        IO.println("affirmative then");
    } else if (answer.toLowerCase().equals("no")) {
        IO.println("i guess not");
    } else {
        IO.println("I don't get it");
    }
}
