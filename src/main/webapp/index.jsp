<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="styl.css"/>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<% if(session.getAttribute("user")==null){%>
<h1>Witamy w naszej aplikacji!</h1>
<h2>Zaloguj się:</h2>
<h1>Zarejestruj się w aplikacji</h1>
<a href="formularz.jsp">Kliknij, żeby się zarejestrować</a>
<%}%>
<% if(session.getAttribute("user")!=null){%>
<h2>${user.name} witaj w naszej aplikacji!</h2>
<%}%>
<form action = 'logout'>
    <input type ='submit' value="Wyloguj się"/>
</form>


</body>
</html>