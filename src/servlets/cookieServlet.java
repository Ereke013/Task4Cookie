package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/index")
public class cookieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookies[] =request.getCookies();
        String cookie_val="1";
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
                        cookie_val = c.getValue();
                        break;
                    }catch (Exception e){
                        cookie_val="1";
                    }
                }
            }
        }
        request.setAttribute("cookieValue", cookie_val);
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }
}
