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
        name="logoutServlet",
        value={"/logout"}
)
public class logout extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

HttpSession session=request.getSession();
session.invalidate();
RequestDispatcher rd =request.getRequestDispatcher("index.jsp");
rd.forward(request,response);
    }}
