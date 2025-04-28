
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Logowanie</title>
</head>
<body>
<title>Formularz logowania</title>
<h1> Zaloguj się</h1>
<form action="login-servlet">
Wpisz login: <input type="text" name="login"/>
Wpisz hasło: <input type="password" name="haslo"/>
<input type="submit" value="Wyślij">
</form>
<p>
  <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
</p>
</body>
</html>
