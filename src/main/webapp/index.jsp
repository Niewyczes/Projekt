<%@ page import="io.ds.pierwszy.User, io.ds.pierwszy.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Rypka</title>
    <link rel="stylesheet" href="styl.css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
    body {
      background-color: lightyellow;
    }
    h1 {
        color: darkgreen;
        text-align: center;
        font-family:"Bodoni MT";
    }
    h2{
        text-align: center;
        font-size: 36px;
    }
    .category-menu{
    text-align:center;
    }
</style>
<%
    User user = (User) session.getAttribute("user");
    List<Product> products = (List<Product>) application.getAttribute("globalProducts");
    String selectedCategory = request.getParameter("kategoria"); //test
%>

<h1>Rypka!</h1>
<%if (user==null){ %>
<h2>Potrzebujesz artykułów wędkarskich albo chcesz zacząć</h2>
<a href="logowanie.jsp">ZALOGUJ SIĘ</a>
<a href="formularz.jsp">REJESTRACJA</a>
<%} else{ %>
<p> Witaj <%= user.getName() %> <%=user.getSurname()%>!</p>
    <form action='user-panel' method ='post'>
        <input type = 'submit' value='Profil użytkownika'/>
        </form>
        <form action = 'logout' method ='post'>
        <input type ='submit' value='Wyloguj się'/>
        </form>
<%} %>

<h2>Kategorie:</h2>
<div class="category-menu">
    <a href="index.jsp?kategoria=Wędziska">Wędziska</a>
    <a href="index.jsp?kategoria=Akcesoria">Akcesoria</a>
    <a href="index.jsp?kategoria=Przynęty">Przynęty</a>
    <a href="index.jsp?kategoria=Podbieraki">Podbieraki</a>
    <a href="index.jsp">[Pokaż wszystkie]</a>
</div>

<h2>Oto nasze produkty:</h2>
<% if (products == null) { %>
<p style="color:red;">Produkty nie zostały załadowane!</p>
<% } else { %>
<%
    int visibleProductCount = 0;
    for (Product product : products) {
        if (selectedCategory == null || product.getCategory().equalsIgnoreCase(selectedCategory)) {
            visibleProductCount++;
        }
    }
%>
<p style="color:green;">Załadowano <%= visibleProductCount %> produktów<%= (selectedCategory != null ? " w kategorii: " + selectedCategory : "") %>!</p>
<ul>
    <% for (Product product : products) {
        if (selectedCategory == null || product.getCategory().equalsIgnoreCase(selectedCategory)) {
    %>

    <li>
        <strong>Kategoria:</strong> <%= product.getCategory() %><br/>
        <strong>Nazwa:</strong> <%= product.getName() %><br/>
        <strong>Cena:</strong> <%= product.getPrice() %> PLN<br/>
        <strong>Opis:</strong> <%= product.getDescription() %><br/>
        <img src="image/<%= product.getImage() %>" alt="<%= product.getName() %>" style="width:200px; height:auto;"/>
        <form action="cart" method="post">
            <input type="hidden" name="productId" value="<%=product.getId()%>" />
            <input type="number" name="quantity" value="1" min="1"/>
            <button type="submit" class="btn btn-dark">Dodaj do koszyka</button>
        </form>
    </li>
    <%   } // if
    } // for %>
</ul>
<% } %>



</body>
</html>