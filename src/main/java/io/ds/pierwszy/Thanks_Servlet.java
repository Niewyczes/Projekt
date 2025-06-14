package io.ds.pierwszy;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(
        name = "Thanks_Servlet",
        value = {"/thanks-servlet"})
public class Thanks_Servlet extends HttpServlet{
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    HttpSession session=request.getSession();
    response.sendRedirect("index.jsp");
}
}