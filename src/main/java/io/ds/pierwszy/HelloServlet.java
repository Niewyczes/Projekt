//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package io.ds.pierwszy;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(
        name = "helloServlet",
        value = {"/hello-servlet"}
)
public class HelloServlet extends HttpServlet {
    private User user;

    public HelloServlet() {
    }

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String imie = request.getParameter("imie");
        String nazwisko = request.getParameter("nazwisko");
        String login = request.getParameter("login");
        String haslo = request.getParameter("haslo");
        if(imie!=null && nazwisko!=null && login!=null && haslo!=null) {
            this.user = new User(imie, nazwisko, login, haslo);
            response.setContentType("text/html");
            HttpSession session = request.getSession();
            session.setAttribute("user", this.user);
        }

        RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
        dis.forward(request, response);
    }
    public void destroy() {
    }
}
