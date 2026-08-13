import java.io.BufferedReader;
import java.io.FileWriter;

void main() {
  File store = new File("customInput.txt");
  if (store.exists()) {
    try (BufferedReader reader = new BufferedReader(new FileReader(store))) {
      String lastSentence = reader.readLine();
      IO.println("Last time, you said: "+lastSentence);
    } catch (Exception e) {
      IO.println("Bad");
      IO.println(e);
    }

  } else {
    IO.println("Hello for the first time!");
  }
  String input = IO.readln("Tell us something new! ");

  try(PrintWriter writer = new PrintWriter(new FileWriter(store))) {

  } catch (Exception e) {
    IO.println();
  }

}
