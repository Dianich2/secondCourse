package com.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/SecondServlet")
public class SecondServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String param1 = req.getParameter("param1");
        String param2 = req.getParameter("param2");
        System.out.println("Parameters from the second servlet: " +param1 + " " + param2);

        //resp.sendRedirect("welcome.jsp");
        req.getRequestDispatcher("welcome.jsp").forward(req, resp);
    }
}