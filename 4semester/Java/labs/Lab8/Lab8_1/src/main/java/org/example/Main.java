package org.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class Main {
    public static void main(String[] args) {

        URL url = null;
        String uri = "https://github.com/ValentineKornel";
        try{
            url = new URL(uri);
        }catch (MalformedURLException e){
            e.printStackTrace();
        }
        if (url == null){
            throw new RuntimeException();
        }
        try (BufferedReader bufferedReader =
                    new BufferedReader(new InputStreamReader(url.openStream())))
        {
            String line = "";
            while ((line = bufferedReader.readLine()) != null){
                System.out.println(line);
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}