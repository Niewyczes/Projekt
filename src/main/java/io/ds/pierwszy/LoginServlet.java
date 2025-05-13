package io.ds.pierwszy;
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


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String login = request.getParameter("login");
        String password = request.getParameter("haslo");
        if (login == null || password == null || login.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Wprowadź login i hasło.");
            request.getRequestDispatcher("logowanie.jsp").forward(request, response);
            return;
        }
        User user = UserList.getUser(login);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");

        } else {
            request.setAttribute("error","Nieprawidłowy login lub haslo");
            request.getRequestDispatcher("logowanie.jsp").forward(request, response);

        }
    }


    public void destroy() {
    }
}
