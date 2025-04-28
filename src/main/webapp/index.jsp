<%@ page import="io.ds.pierwszy.User, io.ds.pierwszy.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Rypka</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
<style>
    h1 {
        text-align: center;
    }
</style>
<% User user = (User) session.getAttribute("user");
%>
<%if (user==null){%>
<h1>Witamy na stronie Rypka!</h1>
<h2>Potrzebujesz artykułów wędkarskich albo chcesz zacząć</h2>
<h3>Zaloguj się:</h3>
<h3>Rejestracja:</h3>
<h2>Oto nasze produkty:</h2>
<%
    List<Product> products = (List<Product>) application.getAttribute("globalProducts");
%>
<% if (products == null) { %>
<p style="color:red;">Produkty nie zostały załadowane!</p>
<% } else { %>
<p style="color:green;">Załadowano <%= products.size() %> produktów!</p>
<ul>
    <% for (Product product : products) { %>
    <li>
        <strong>Nazwa:</strong> <%= product.getName() %><br/>
        <strong>Cena:</strong> <%= product.getPrice() %> PLN<br/>
        <strong>Opis:</strong> <%= product.getDescription() %>
    </li>
    <% } %>
</ul>
<% } %>
<form action = 'logout'>
    <input type ='submit' value='Wyloguj się'/>
</form>
<%} %>

</body>
</html>