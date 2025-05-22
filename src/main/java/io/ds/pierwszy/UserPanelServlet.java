package io.ds.pierwszy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(
        name = "UserPanel",
        value = {"/user-panel"}
)
public class UserPanelServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        if(user ==null){
            response.sendRedirect("logowanie.jsp");
            return;
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("UserPanel.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user ==null){
            response.sendRedirect("logowanie.jsp");
            return;
        }
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String password = request.getParameter("password");
        if (name != null && !name.isEmpty()) user.setName(name);
        if (surname != null && !surname.isEmpty()) user.setSurname(surname);
        if (password != null && !password.isEmpty()) user.setPassword(password);
        response.sendRedirect("user-panel");
    }
}