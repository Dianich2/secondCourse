package com.example.lab12;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "FirstServlet", value = "/FirstServlet")
public class FirstServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> strings = new ArrayList<String>();
        strings.add("Book 1");
        strings.add("Book 2");
        strings.add("Book 3");
        strings.add("Book 4");
        strings.add("Book 5");
        request.setAttribute("items", strings);
        getServletContext().getRequestDispatcher("/first.jsp").forward(request, response);
    }

}