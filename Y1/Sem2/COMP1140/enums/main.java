// demo

int generateNumber() {
  return 0;
}

void main() {
  // 1. Generate number
  // 2. enter a loop
  //  ask for a number
  //  compare guess to secret number
  //  if equal, then we win! exit loop
  //  if less, say "smaller"
  //  if greater, say "bigger"
  
  int secret = generateNumber();
  boolean correctGuess = false;

  while (!correctGuess) {
    IO.print("Enter a guess: ");
    int currentGuess = Integer.parseInt(IO.readln());
    if (currentGuess == secret) {
      IO.println("You win!");
      break;
    } else if (currentGuess < secret) {
      IO.println("Bigger");
    } else if (currentGuess > secret) {
      IO.println("Smaller");
    }
  }
}
