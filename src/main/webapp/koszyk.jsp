<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,io.ds.pierwszy.Product,io.ds.pierwszy.Cart" %>
<html>
<head>
  <title>Koszyk</title>
</head>
<body>
<h1>Mój koszyk</h1>

<%
  // Obsługa usunięcia określonej ilości produktu
  String action = request.getParameter("action");
  String productIdParam = request.getParameter("productId");
  String quantityParam = request.getParameter("removeQuantity");

  if ("remove".equals(action) && productIdParam != null && quantityParam != null) {
    int productId = Integer.parseInt(productIdParam);
    int removeQty = Integer.parseInt(quantityParam);
    Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");

    if (cart != null && cart.containsKey(productId)) {
      Cart cartItem = cart.get(productId);
      int currentQty = cartItem.getQuantity();

      if (removeQty >= currentQty) {
        // Usuń całkowicie
        cart.remove(productId);
      } else {
        // Zmniejsz ilość
        cartItem.setQuantity(currentQty - removeQty);
        cart.put(productId, cartItem);
      }
      session.setAttribute("cart", cart);
    }
  }

  // Wyświetlanie koszyka
  Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
  double total = 0.0;

  if (cart != null && !cart.isEmpty()) {
    for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
      Cart cartItem = entry.getValue();
      int quantity = cartItem.getQuantity();
      Product p = cartItem.getProduct();
      double subtotal = cartItem.getTotalPrice();
      total += subtotal;
%>
<p>
  <strong><%= p.getName() %></strong> - ilość: <%= quantity %>, cena: <%= String.format("%.2f",subtotal) %> PLN
  <!-- Formularz usuwania określonej ilości -->
<form action="koszyk.jsp" method="post" style="display:inline;">
  <input type="hidden" name="action" value="remove">
  <input type="hidden" name="productId" value="<%= p.getId() %>">
  <input type="number" name="removeQuantity" min="1" max="<%= quantity %>" value="1" required>
  <button type="submit">Usuń sztuki</button>
</form>
</p>
<%
  }
%>
<p><strong>Suma: <%= String.format("%.2f", total) %> PLN</strong></p>
<form action="Strona_z_podziękowaniem.jsp" method="post">
  <input type="hidden" name="action" value="order">
  <button type="submit">Zamawiam</button>
</form>
<%
} else {
%>
<p>Koszyk jest pusty</p>
<%
  }
%>

<a href="index.jsp">Powrót do strony głównej</a>

</body>
</html>
