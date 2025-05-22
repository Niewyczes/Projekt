
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="io.ds.pierwszy.User" %>
<%User user = (User) request.getAttribute("user");
  if (user == null) {
    user = (User) session.getAttribute("user");
  }
  if (user == null) {
    System.out.println("Nieprawidłowy dostęp, użytkownik nie jest zalogowany.");
    return;
  }
%>
<html>
<head>
  <title>Panel użytkownika</title>
</head>
<body>
<h1>Dane Twojego profilu</h1>
<form method="post">
  Imię:<input type="text" name="name" value="<%=user.getName()%>"><br>
  Nazwisko:<input type="text" name="surname" value="<%=user.getSurname()%>"><br>
  Login:<input type="text" value="<%=user.getLogin()%>" readonly><br>
  Hasło:<input type="text" name="password" placeholder="Wpisz nowe hasło"><br>
  <input type="submit" value="Zapisz zmiany">
  <h2>Kliknij poniżej jeśli chcesz wrócić do strony głównej</h2>
  <a href="index.jsp">Strona główna</a>
</form>
</body>
</html>
