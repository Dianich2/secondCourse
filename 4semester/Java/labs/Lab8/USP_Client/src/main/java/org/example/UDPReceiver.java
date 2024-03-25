package org.example;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UDPReceiver {

    public static void main(String[] args) {
        try (DatagramSocket socket = new DatagramSocket(9090)){
            byte[] buffer = new byte[1024];
            DatagramPacket packet = new DatagramPacket(buffer, buffer.length);

            socket.receive(packet);

            String message = new String(packet.getData(), 0, packet.getLength());
            System.out.println("Received message: \n" + message);


        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
