package com.example.lab910.servlets;

import com.example.lab910.entities.ROLES;
import com.example.lab910.entities.User;
import com.example.lab910.repositories.Repository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Repository repository = new Repository();
        User user = null;
        try {
            user = repository.findUserByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(user != null){
            req.setAttribute("message", "This username is already taken");
            RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
            dispatcher.forward(req, resp);
        }else{
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setRole(ROLES.USER);
            newUser.setPassword(hashedPassword);

            try {
                repository.saveUser(newUser);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            resp.sendRedirect("login.jsp");
        }
    }
}
