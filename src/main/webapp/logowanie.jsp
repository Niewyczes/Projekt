
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Logowanie</title>
</head>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>
<body>
<title>Formularz logowania</title>
<h1> Zaloguj się</h1>
<form action="login-servlet" method="post">
Wpisz login: <input type="text" name="login"/>
Wpisz hasło: <input type="password" name="haslo"/>
<input type="submit" value="Wyślij">
</form>
</body>
</html>
