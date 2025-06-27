<%@ page import="io.ds.pierwszy.User, io.ds.pierwszy.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Rypka</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
    body {
        background-color: lightyellow;
        font-family: Arial, sans-serif;
    }

    h1 {
        color: darkgreen;
        text-align: center;
        font-family: "Bodoni MT", serif;
        margin-top: 20px;
    }

    h2 {
        text-align: center;
        font-size: 28px;
        color: #006400;
    }

    .btn-main {
                background-color: #ccffcc;
                color: #004d00;
                padding: 10px 20px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-family: Arial, sans-serif;
                font-size: 16px;
                font-weight: bold;
                text-decoration: none;
                text-transform: uppercase;
                transition: background-color 0.3s ease;
                display: inline-block;
                text-align: center;
                margin: 8px 10px 8px 0;
                min-width: 140px;
            }

            .btn-main:hover {
                background-color: #b3ffb3;
            }

            .category-menu {
                text-align: center;
                margin-bottom: 20px;
            }

    .category-menu {
        text-align: center;
        margin-bottom: 20px;
    }

    ul {
        list-style: none;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 30px;
    }

    li {
        border: 1px solid #a0d6a0;
        border-radius: 10px;
        padding: 15px;
        width: 280px;
        background-color: #e6ffe6;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    li img {
        max-width: 100%;
        border-radius: 8px;
        margin: 10px 0;
    }

    p {
        text-align: center;
        font-size: 18px;
    }

     button.btn-main {
                min-width: auto;
                padding: 8px 16px;
                text-transform: none;
                font-weight: normal;
            }
  </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    List<Product> products = (List<Product>) application.getAttribute("globalProducts");
    String selectedCategory = request.getParameter("kategoria"); //test
%>
<%
    String success=request.getParameter("success");
    if("1".equals(success)){
        String productName=(String)session.getAttribute("LastAddedProductName");
        Integer quantity=(Integer)session.getAttribute("LastAddedQuantity");
%>
<div style="text-align:center; margin: 10px 0; color:green;">
    Dodano do koszyka <strong><%=productName %></strong>,ilość: <strong><%=quantity%></strong> :)
</div>
<%
    }
%>
<h1>Rypka!</h1>
<%if (user==null){ %>
<h2>Potrzebujesz artykułów wędkarskich albo chcesz zacząć</h2>
<a href="logowanie.jsp" class="btn-main">ZALOGUJ SIĘ</a>
    <a href="formularz.jsp" class="btn-main">REJESTRACJA</a>
<%} else{ %>
<p> Witaj <%= user.getName() %> <%=user.getSurname()%>!</p>
 <form action="user-panel" method="post" style="text-align:center; margin-bottom: 10px;">
         <button type="submit" class="btn-main">Profil użytkownika</button>
     </form>
     <form action="logout" method="post" style="text-align:center; margin-bottom: 10px;">
         <button type="submit" class="btn-main">Wyloguj się</button>
     </form>
<%} %>
<div style="text-align:center; margin-bottom: 20px;">
    <a href="koszyk.jsp" class="btn-main">Zobacz koszyk</a>
</div>
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
        <form action="cart-servlet" method="post">
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