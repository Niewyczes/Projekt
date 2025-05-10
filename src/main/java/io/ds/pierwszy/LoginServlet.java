package io.ds.pierwszy;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(
        name = "LoginServlet",
        value = {"/login-servlet"}
)
public class LoginServlet extends HttpServlet {
    private User user;

    public LoginServlet() {
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("user");
        System.out.println("tu");
        if (sessionUser != null) {
            response.getWriter().write("Zalogowany użytkownik: " + sessionUser.getLogin());
        } else {
            response.getWriter().write("Brak zalogowanego użytkownika.");
        }

        RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
        dis.forward(request, response);
    }



    public void destroy() {
    }
}