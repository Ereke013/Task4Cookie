package servlets;

import db.DBManager;
import db.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(value = "/homeDesign")
public class homeDesignServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(":::" + request.getParameter("style_of_site_value"));
        String style_of_site_value;
        Cookie cookies[] = request.getCookies();
        style_of_site_value = request.getParameter("style_of_site_value");
        Cookie cookie = new Cookie("my_style_of_site", style_of_site_value);
        request.setAttribute("style", cookie.getValue());
        cookie.setMaxAge(3600 * 24 * 365);
        response.addCookie(cookie);
        System.out.println("2222");
        response.sendRedirect("/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<News> news = null;
        try {
            news = DBManager.getAllNews();
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Cookie c:request.getCookies()) {
            if (c.getName().equalsIgnoreCase("my_style_of_site")){
                request.setAttribute("style", c.getValue());
            }
        }
        request.setAttribute("news", news);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}
