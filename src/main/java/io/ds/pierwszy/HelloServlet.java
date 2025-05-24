//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package io.ds.pierwszy;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;



@WebServlet(
        name = "helloServlet",
        value = {"/hello-servlet"}
)
public class HelloServlet extends HttpServlet { ;

    public HelloServlet() {
    }

    public void init() {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("formularz.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        if(name==null || surname==null || login==null || password==null ||
                name.isEmpty() || surname.isEmpty() || login.isEmpty() || password.isEmpty()) {
        request.setAttribute("error","Trzeba wypełnić wszystkie pola");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if(name.length()<4 || name.length() >20){
            request.setAttribute("error", "Imię musi mieć od 4 do 20 znaków");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if (!name.matches("\\p{L}+")){
            request.setAttribute("error","Imie musi zawierać tylko litery");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if(!surname.matches("\\p{L}+")){
            request.setAttribute("error","Nazwisko musi zawierać tylko litery");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if(surname.length()<4 || surname.length() >20){
            request.setAttribute("error", "Nazwisko musi mieć od 4 do 20 znaków");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if (login.length() < 5 || login.length() > 20) {
            request.setAttribute("error","login musi mieć długość  conajmniej 5 znaków i nie więcej niż 20");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if(UserList.getUser(login)!=null){
            request.setAttribute("error", "login już jest zajęty");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if(password.length() < 6||password.length()>20) {
            request.setAttribute("error","Hasło musi mieć długość conajmniej 5 znaków i nie więcej niż 20");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if (!password.matches(".*[^a-zA-Z0-9].*")) {
            request.setAttribute("error", "Hasło musi zawierać przynajmniej jeden znak specjalny.");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }
        if (!password.matches(".*\\d.*")) {
            request.setAttribute("error", "Hasło musi zawierać przynajmniej jedną cyfrę.");
            request.getRequestDispatcher("formularz.jsp").forward(request, response);
            return;
        }

            User newUser = new User(name,surname,login,password);
        UserList.addUser(newUser);
        User userFromList = UserList.getUser(login);
        HttpSession session = request.getSession();
        session.setAttribute("user",userFromList);
        session.setAttribute("login",login);
        response.sendRedirect("index.jsp");
    }
    public void destroy() {
    }
}
