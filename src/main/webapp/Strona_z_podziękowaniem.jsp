<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 14.06.2025
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Map" %>
<%
    session.removeAttribute("cart");
    session.removeAttribute("LastAddedProductName");
    session.removeAttribute("LastAddedQuantity");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Strona_z_podziękowaniem</title>
    <style>
            body {
                background-color: lightyellow;
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 80px;
            }

            p {
                font-size: 24px;
                color: #006400;
            }

            .btn-main {
                background-color: #ccffcc;
                color: #004d00;
                padding: 12px 24px;
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
                margin-top: 20px;
            }

            .btn-main:hover {
                background-color: #b3ffb3;
            }
        </style>

</head>
<body>
<p><strong> Dziękujemy za zakupy w naszym sklepie</strong></p>
    <a href="index.jsp" class="btn-main"> Powrót do strony głównej</a>
</body>
</html>
