package org.example;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UDPSender {
    public static void main(String[] args) {
        try (DatagramSocket socket = new DatagramSocket()){
            InetAddress address = InetAddress.getByName("localhost");
            int port = 9090;

            String message = "Message via UDP";
            DatagramPacket packet = new DatagramPacket(message.getBytes(), message.getBytes().length, address, port);
            socket.send(packet);

            System.out.println("Message sent");
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
