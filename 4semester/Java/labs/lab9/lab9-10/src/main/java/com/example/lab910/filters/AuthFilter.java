package com.example.lab910.filters;


import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestURI = httpRequest.getRequestURI();
        // Проверяем, если запрос направлен на страницу login.jsp, то пропускаем его
        if(requestURI.equals("/lab9_10_war_exploded/login.jsp") || requestURI.equals("/lab9_10_war_exploded/LoginServlet")
        || requestURI.equals("/lab9_10_war_exploded/register.jsp") || requestURI.equals("/lab9_10_war_exploded/RegisterServlet"))
        {
            chain.doFilter(request, response);
            return;
        }

        // Проверяем, авторизован ли пользователь
        boolean userLoggedIn = checkIfUserIsLoggedIn(httpRequest);

        // Если пользователь не авторизован, перенаправляем его на страницу регистрации
        if (!userLoggedIn) {
            httpResponse.sendRedirect("login.jsp");
            return;
        }

        // Если пользователь авторизован, пропускаем запрос дальше по цепочке фильтров
        chain.doFilter(request, response);
}

    private boolean checkIfUserIsLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedInUser") != null) {
            return true;
        } else {
            return false;
        }
    }
}
