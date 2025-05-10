<%@ page import="io.ds.pierwszy.User, io.ds.pierwszy.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <title>Rypka</title>
    <link rel="stylesheet" href="styl.css"/>
</head>
<body>
<style>
    h1 {
        text-align: center;
    }
</style>


<%  User user = (User) session.getAttribute("user");
    List<Product> products = (List<Product>) application.getAttribute("globalProducts");
%>
<h1>Witamy na stronie Rypka!</h1>
<%if (user==null){ %>
<h2>Potrzebujesz artykułów wędkarskich albo chcesz zacząć</h2>
<h3>Zaloguj się:</h3>
<a href="logowanie.jsp">Kliknij tutaj aby się zalogować</a>
<h3>Rejestracja:</h3>
<a href="formularz.jsp">Kliknij tutaj aby dokonać rejestracji</a>
<%} else{ %>
<p> Witaj <%= user.getName() %>!</p>
<form action = 'logout'>
    <input type ='submit' value='Wyloguj się'/>
</form>
<% } %>

<% %>
<h2>Oto nasze produkty:</h2>
<% if (products == null) { %>
<p style="color:red;">Produkty nie zostały załadowane!</p>
<% } else { %>
<p style="color:green;">Załadowano <%= products.size() %> produktów!</p>
<ul>
    <% for (Product product : products) { %>
    <li>
        <strong>Kategoria:</strong> <%=product.getCategory()%><br/>
        <strong>Nazwa:</strong> <%= product.getName() %><br/>
        <strong>Cena:</strong> <%= product.getPrice() %> PLN<br/>
        <strong>Opis:</strong> <%= product.getDescription() %>
        <img src="image/<%= product.getImage() %>" alt="<%= product.getName() %>" style="width:200px; height:auto;"/>
        <form action="cart" method="post">
            <input type="hidden" name="productId" value="<%=product.getId()%>" />
            <label for="quantity_<%=product.getId() %>" type="number" name="quantity" value="1" min="1"/>
            <button type="submit" class="btn btn-dark">Dodaj do koszyka</button>
            </form>
    <% } %>
</ul>
<% } %>
</body>
</html>