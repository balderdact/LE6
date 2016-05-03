package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Controller extends HttpServlet {
    
    private User account = new User();
    private int failedAttempts = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession(false);
            if (session != null)
                session.invalidate();
            request.getRequestDispatcher("/login.jsp").forward(request, response);          
        }
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        boolean correctUsername = username.equals(account.getUsername());
        boolean correctPass = password.equals(account.getPassword());
        if (correctUsername && correctPass) {
            request.getRequestDispatcher("convert.jsp").forward(request, response);
        } else {
            if (failedAttempts < 3) {
                failedAttempts++;
                request.getRequestDispatcher("error1.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("error2.jsp").forward(request, response);
            }
        }       
    }

}
