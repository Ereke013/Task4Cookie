package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/admin")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lan = request.getParameter("lan");
        if(lan!=null){
            request.getRequestDispatcher("/ad_language.jsp").forward(request, response);
        }
        String news = request.getParameter("new");
        if(news!=null){
            request.getRequestDispatcher("/adminNews.jsp").forward(request, response);
        }
        String pub = request.getParameter("pub");
        if(pub!=null){
            request.getRequestDispatcher("/adminPublications.jsp").forward(request, response);
        }
    }
}
