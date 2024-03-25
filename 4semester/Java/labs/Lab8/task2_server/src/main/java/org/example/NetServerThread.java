package org.example;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class NetServerThread {
    public static void main(String[] args) {
        List<ServerThread> users = new ArrayList<>();

        try {
            ServerSocket server = new ServerSocket(7071);
            System.out.println("initialized");
            while (true){

                Socket socket = server.accept();

                ServerThread thread = new ServerThread(socket, users);
                users.add(thread);
                thread.start();
            }
        }catch (IOException e){
            System.out.println(e);
        }
    }
}
