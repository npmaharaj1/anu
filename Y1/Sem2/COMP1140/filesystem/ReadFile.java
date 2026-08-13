import java.io.IOException;

void main() { // optional throws keyword to ignore
  File f = new File("FileSystem.java");

  try {
    FileReader fr = new FileReader(f);
    BufferedReader br = new BufferedReader(fr);
    String line = br.readLine();
    while (line != null) {
      IO.println(line);
      line = br.readLine();
    }
  } catch (FileNotFoundException e) {
    IO.println("Error: IOException");
    IO.println(e);
  } catch (IOException e) {
    IO.println("Error: IOException");
    IO.println(e);
  }
}
