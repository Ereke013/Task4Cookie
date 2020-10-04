package servlets;

import db.DBManager;
import db.Languages;
import db.News;
import db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addNews")
public class AddNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String short_content = request.getParameter("short_content");
        String content = request.getParameter("content");
        String picture_url = request.getParameter("picture_url");
//        System.out.println("I am here " + request.getParameter("language"));
        Long lId = Long.parseLong(request.getParameter("language"));
        Cookie cookie=new Cookie("language",lId+"");
        cookie.setMaxAge(3600*60*60);
        response.addCookie(cookie);
//        System.out.println("I am here"+lId);
        Long pId = Long.parseLong(request.getParameter("publication"));
        Languages lg= DBManager.getLanguageById(lId);
        System.out.println(lg.toString());
        Publication pub=DBManager.getPublicationById(pId);

        DBManager.addNews(new News(null,title,short_content,content,null,picture_url,lg,pub));
        response.sendRedirect("/adminNews.jsp?success");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
