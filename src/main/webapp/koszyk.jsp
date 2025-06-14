
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,io.ds.pierwszy.Product,io.ds.pierwszy.Cart" %>
<html>
<head>
  <title>Koszyk</title>
</head>
<body>
<h1> Mój koszyk</h1>
<%

  Map<Integer,Cart> cart=(Map<Integer,Cart>) session.getAttribute("cart");
  double total=0.0;
if (cart !=null && !cart.isEmpty()) {
  for (Map.Entry<Integer, Cart> entry : cart.entrySet()){
  Cart cartItem=entry.getValue();
  int quantity = cartItem.getQuantity();
  Product p=cartItem.getProduct();
  double subtotal=cartItem.getTotalPrice();
  total+=subtotal;
      %>
<p><strong><%=p.getName()%></strong> - ilość <%= quantity%>,cena:<%=subtotal %>PLN</p
<%
}
  %>
<p><strong>Suma:<%=String.format("%.2f",total)%> PLN</strong></p>
<form action="Strona_z_podziękowaniem.jsp" method ="post">
  <input type="hidden" name="action" value="order">
  <button type="submit">Zamawiam</button>
</form>
<%

  }else{
%>
<p> Koszyk jest pusty</p>
<%
}%>

<a href="index.jsp"> Powrót do strony głównej</a>



</body>
</html>