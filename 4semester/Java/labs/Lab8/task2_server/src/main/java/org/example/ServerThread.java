package org.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class ServerThread extends Thread{
    private PrintStream os;
    private BufferedReader is;
    private InetAddress addr;
    private List<ServerThread> users;
    private List<String> messages = new ArrayList<>();



    public ServerThread(Socket s, List<ServerThread> users) throws IOException{
        os = new PrintStream((s.getOutputStream()));
        is = new BufferedReader(new InputStreamReader(s.getInputStream()));
        addr = s.getInetAddress();
        this.users = users;
    }

    @Override
    public void run() {

        boolean exit = false;
        try {
            String str = "";
            os.write(("send your command"+"\n").getBytes());
            while (!exit){
                str = is.readLine();
                System.out.println(str);
                switch (str){
                    case "n":{
                        setNickname();
                        break;
                    }
                    case "u":{
                        sendUsers();
                        break;
                    }
                    case "newM": {
                        sendMessage();
                        break;
                    }
                    case "myM": {
                        for (String m: messages) {
                            os.write((m+"\n").getBytes());
                        }
                        os.write(("done"+"\n").getBytes());
                        break;
                    }
                    case "quit":{
                        exit = true;
                        break;
                    }
                    default:{
                        os.write(("incorrect command"+"\n").getBytes());
                    }
                }
                os.write(("You have " + messages.size() + " messages " +" send your command"+"\n").getBytes());
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        finally {
            disconnect();
        }

    }

    private void setNickname() throws IOException {
        String str = is.readLine();
        this.setName(str);
        System.out.println(addr.getHostName() +
                " sets name " + str);
    }

    private void sendUsers() throws IOException {
        String message = "";
        for (Thread user: users) {
            message += user.getName() + ",   ";
        }
        os.write((message+"\n").getBytes());
    }

    public void sendMessage() throws IOException {
        String receiver = is.readLine();
        System.out.println("receiver: " + receiver);
        String message = is.readLine();
        System.out.println("message: " + message);
        for (ServerThread user : users) {
            if (user.getName().equals(receiver)){
                user.receiveMessage("New message from " + this.getName() + ":\n" + message + "\n");
            }
        }
    }

    public void receiveMessage(String message){
        messages.add(message);
    }

    public void disconnect(){
        try {
            if(os != null){
                os.close();
            }
            if(is != null){
                is.close();
            }
            System.out.println(this.getName() + " disconnecting");
        }catch (IOException e){
            e.printStackTrace();
        }
        finally {
            users.remove(this);
            this.interrupt();
        }
    }
}
