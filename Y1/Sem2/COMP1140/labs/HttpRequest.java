import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

void main() {

  try (Socket s = new Socket("comp1110.muehlboeck.name", 80);
       OutputStreamWriter sw = new OutputStreamWriter(s.getOutputStream());
       InputStreamReader sr = new InputStreamReader(s.getInputStream());
       BufferedReader br = new BufferedReader(sr);) {

    sw.write("GET http://comp1110.muehlboeck.name/hello.txt HTTP/1.0\r\n\r\n");
    sw.flush();
    String line = br.readLine();
    while (line != null) {
      IO.println(line);
      line = br.readLine();
    }
  }  catch (IOException e) {

  }

}
