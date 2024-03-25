package com.example.lab910.cookies;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Date;

public class AktCookies {

    private static int number = 1;
    public static void setCookie(HttpServletResponse resp) {
        String name = "PNV";
        String role = "moderator" + number++;
        Cookie c = new Cookie(name, role);
        c.setMaxAge(60 * 60); // время жизни файла cookie
        resp.addCookie(c); // добавление cookie к объекту-ответ
        String value = resp.getLocale().toString();
        Cookie loc = new Cookie("locale", value);
        resp.addCookie(loc);
    }

    public static ArrayList<String> addToRequest(HttpServletRequest request) {
        ArrayList<String> messages = new ArrayList<>();

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            Date currentDate = new Date();

            boolean lastVisitCookieExists = false;

            for (Cookie cookie : cookies) {
                String name = cookie.getName();
                String value = cookie.getValue();

                if (name.equals("lastVisit")) {
                    cookie.setValue(currentDate.toString());
                    messages.add("Last visit time: " + currentDate.toString());
                    lastVisitCookieExists = true;
                    break;
                }
            }

            if (!lastVisitCookieExists) {
                Cookie lastVisitCookie = new Cookie("lastVisit", currentDate.toString());
                lastVisitCookie.setMaxAge(3600); // Устанавливаем время жизни куки в секундах (здесь 1 час)
                messages.add("Last visit time: " + currentDate.toString());
            }

            int visitCount = 0;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("visitCount")) {
                    visitCount = Integer.parseInt(cookie.getValue());
                    break;
                }
            }
            visitCount++;
            Cookie visitCountCookie = new Cookie("visitCount", String.valueOf(visitCount));
            visitCountCookie.setMaxAge(3600);
            messages.add("Visit count: " + visitCount);

            String userType = request.getParameter("userType");
            if (userType != null) {
                Cookie userTypeCookie = new Cookie("userType", userType);
                userTypeCookie.setMaxAge(3600);
                messages.add("User type: " + userType);
            }
        }

        return messages;
    }

}
