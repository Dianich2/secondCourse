package com.example.lab910.filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LoggingFilter implements Filter {

    private static final Logger LOGGER = Logger.getLogger(LoggingFilter.class.getName());
    static {
        try {
            LOGGER.setUseParentHandlers(false);
            FileHandler fileHandler = new FileHandler("D:\\Study\\university\\4semester\\Java\\labs\\lab8\\lab9-10\\application.log");

            SimpleFormatter formatter = new SimpleFormatter();
            fileHandler.setFormatter(formatter);

            LOGGER.addHandler(fileHandler);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Логгирование действия пользователя (выполнение метода, время, имя сервлета и т.д.)
        String methodName = httpRequest.getMethod();
        String servletName = httpRequest.getServletPath();
        LocalDateTime timestamp = LocalDateTime.now();

        LOGGER.info("Action: " + methodName + " on " + servletName + " at " + timestamp);

        // Пропускаем запрос дальше по цепочке фильтров
        chain.doFilter(request, response);
    }

}
