package myspring;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class InputString {

    String inputStr;

    public void setString(String str) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Please enter your string: ");
        inputStr = br.readLine();
    }

    public void getString() {
        System.out.println("Your entered: " + inputStr);
    }
}
