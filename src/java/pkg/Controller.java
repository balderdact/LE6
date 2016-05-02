package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Controller extends HttpServlet {
    
    private User account = new User("cunagervacio", "2ith");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        boolean correctUsername = username.equals(account.getUsername());
        boolean correctPass = password.equals(account.getPassword());
        if (correctUsername && correctPass) {
            request.getRequestDispatcher("convert.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }       
    }

}
