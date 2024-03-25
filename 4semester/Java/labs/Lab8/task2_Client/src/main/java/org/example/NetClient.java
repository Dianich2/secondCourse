package org.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Scanner;

public class NetClient {
    public static void main(String[] args) {
        Socket socket = null;
        BufferedReader bufferedReader = null;

        try {
            socket = new Socket(InetAddress.getLocalHost(), 7071);

            PrintStream printStream =
                    new PrintStream(socket.getOutputStream());
            bufferedReader = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));
            Scanner scan = new Scanner(System.in);


            String command = "";
            while (!command.equals("quit")){
                String m = bufferedReader.readLine();
                System.out.println(m);

                command = scan.nextLine();
                printStream.write((command+"\n").getBytes());
                switch (command){
                    case "n":{
                        System.out.println("Input nickname");
                        String nickName = scan.nextLine();
                        //scan.close();
                        printStream.write((nickName+"\n").getBytes());
                        break;
                    }
                    case "u":{
                        System.out.println("Users: ");
                        System.out.println(bufferedReader.readLine());
                        break;
                    }
                    case "newM":{
                        System.out.println("write a nickname of user to send message to"+"\n");
                        String receiver = scan.nextLine();
                        printStream.write((receiver+"\n").getBytes());
                        System.out.println("Write a message:\n");
                        String message = scan.nextLine();
                        printStream.write((message+"\n").getBytes());
                        break;
                    }
                    case "myM":{
                        String message = "";
                        while(!message.equals("done")){
                            message = bufferedReader.readLine();
                            System.out.println(message);
                        }
                        break;
                    }

                    case "quit":{
                        printStream.write(("quit"+"\n").getBytes());
                    }
                    default:{
                        System.out.println(bufferedReader.readLine());
                    }
                }
            }


        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
