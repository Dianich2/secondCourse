package com.example.lab910.servlets;

import com.example.lab910.cookies.AktCookies;
import com.example.lab910.entities.Player;
import com.example.lab910.entities.ROLES;
import com.example.lab910.entities.User;
import com.example.lab910.repositories.Repository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String candidatePassword = req.getParameter("password");
        Repository repository = new Repository();
        User user = null;
        try {
            user = repository.findUserByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if(user != null){
            if (BCrypt.checkpw(candidatePassword, user.getPassword())){
                ServletContext sc = this.getServletContext();
                AktCookies.setCookie(resp);
                sc.setAttribute("username", username);
                sc.setAttribute("welcomeMessage"," time: " + LocalTime.now().toString());
                HttpSession session = req.getSession(true);
                session.setAttribute("loggedInUser", true);
                sc.setAttribute("cookieMessage", AktCookies.addToRequest(req) );

                if(user.getRole() == ROLES.USER){
                    sc.setAttribute("userId", user.getId());
                    sc.setAttribute("role", user.getRole().toString());
                    resp.sendRedirect("homeUser.jsp");
                }else {
                    sc.setAttribute("userId", user.getId());
                    sc.setAttribute("role", user.getRole().toString());
                    List<Player> players = null;
                    try {
                        players = repository.findPlayersByCoachId(user.getId());
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    sc.setAttribute("pl", players);
                    resp.sendRedirect("homeAdmin.jsp");
                }
            }else{
                req.setAttribute("message", "incorrect username or password");
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, resp);
            }
        }else{
            req.setAttribute("message", "incorrect username or password");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}