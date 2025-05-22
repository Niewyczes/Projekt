<%--
  Created by IntelliJ IDEA.
  User: Wykładowca
  Date: 01.03.2025
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz Rejestracji Rypka</title>
</head>
<body>
<h1>Zarejestruj się w aplikacji</h1>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>
<form action="hello-servlet" method="post">
    Wpisz login: <input type="text" name="login" maxlength="20" minlength="5" />
    Wpisz hasło: <input type="password" name="password" maxlength="20" minlength="6" />
    Wpisz imię: <input type="text" name="name" maxlength="14" minlength="4" />
    Wpisz nazwisko: <input type="text" name="surname" maxlength="30" minlength="4" />
    <input type="submit" value="Wyślij">
</form>
</body>
</html>
