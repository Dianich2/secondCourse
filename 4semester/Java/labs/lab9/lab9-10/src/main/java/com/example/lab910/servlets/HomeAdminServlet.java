package com.example.lab910.servlets;

import com.example.lab910.entities.Player;
import com.example.lab910.repositories.Repository;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/homeAdmin")
public class HomeAdminServlet extends HttpServlet {
    Repository repository = new Repository();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext sc = this.getServletContext();
        String name = req.getParameter("name");
        String tel = req.getParameter("tel");
        String email = req.getParameter("email");
        int choachId = (int) sc.getAttribute("userId");
        Player player = new Player(choachId ,name, tel, email);
        try {
            repository.savePlayer(player);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Player> players = null;
        try {
            players = repository.findPlayersByCoachId(choachId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sc.setAttribute("pl", players);
        req.getRequestDispatcher("homeAdmin.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if("delete".equals(action)){
            int id = Integer.parseInt(req.getParameter("id"));
            try {
                repository.deletePlayerById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            ServletContext sc = this.getServletContext();
            int choachId = (int) sc.getAttribute("userId");
            List<Player> players = null;
            try {
                players = repository.findPlayersByCoachId(choachId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            sc.setAttribute("pl", players);
            req.getRequestDispatcher("homeAdmin.jsp").forward(req, resp);

        }else {
            System.out.println("Nothing");
        }
    }
}
