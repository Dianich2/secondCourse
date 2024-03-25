package com.example.demo;

import java.io.*;
import java.time.LocalTime;
import java.util.Enumeration;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "getTimeServlet", value = "/getTime-servlet")
public class GetTimeServlet extends HttpServlet {
    private String time;

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        time = LocalTime.now().toString();
        Enumeration<String> params = request.getHeaderNames();

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + "It's " + time + " now" +"</h1>");
        out.println("<p>"+ "Protocol: "+ request.getProtocol() + "</p>");
        out.println("<p>"+ "Ip: "+ request.getRemoteAddr() + "</p>");
        out.println("<p>"+ "User: "+ request.getRemoteUser() + "</p>");
        out.println("<p>"+ "Method: "+ request.getMethod() + "</p>");
        while (params.hasMoreElements()){
            String name = params.nextElement();
            String value = request.getHeader(name);
            out.println(name + " = " + value);
        }
        out.println("</body></html>");
    }

    public void destroy() {
    }
}