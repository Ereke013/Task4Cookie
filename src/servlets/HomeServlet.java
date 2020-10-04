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
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        ArrayList<News> news = DBManager.getAllNewsByPubl(id);
        request.setAttribute("newsL",news);
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookies[]=request.getCookies();
        String my_Cookie_Val="1";
        String cook="1";
        try {
            cook = request.getParameter("c");
        }catch (Exception e){
            cook="1";
        }
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("language")) {
                    try {
                        c.setValue(cook);
                        my_Cookie_Val = c.getValue();
                        break;
                    }catch (Exception e){
                        my_Cookie_Val="1";
                    }
                }
            }
        }
        request.setAttribute("cookieValue",cook);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
