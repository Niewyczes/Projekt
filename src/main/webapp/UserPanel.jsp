
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="io.ds.pierwszy.User" %>
<%User user = (User) request.getAttribute("user");
  if (user == null) {
    user = (User) session.getAttribute("user");
  }
  if (user == null) {
    System.out.println("Nieprawidłowy dostęp, użytkownik nie jest zalogowany.");
    return;
  }
%>
<html>
<head>
  <title>Panel użytkownika</title>
  <style>
          body {
              font-family: Arial, sans-serif;
              background-color: #fffecb; /* jasnożółte tło */
              display: flex;
              justify-content: center;
              align-items: center;
              min-height: 100vh;
              margin: 0;
          }

          .profile-container {
              background-color: #e6ffe6; /* jasnozielone tło boxa */
              padding: 40px;
              border-radius: 12px;
              width: 100%;
              max-width: 500px;
              box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
              display: flex;
              flex-direction: column;
              align-items: center;
          }

          h1, h2 {
              color: #006400;
              font-family: "Bodoni MT", serif;
              text-align: center;
              margin-bottom: 20px;
          }

          form {
              width: 100%;
              display: flex;
              flex-direction: column;
              gap: 15px;
          }

          label {
              font-weight: bold;
              color: #004d00;
          }

          input[type="text"],
          input[type="password"] {
              width: 100%;
              padding: 10px;
              border: 1px solid #66cc66;
              border-radius: 6px;
              font-size: 16px;
              box-sizing: border-box;
          }

          input[type="text"][readonly] {
              background-color: #f0fff0;
              color: #333;
          }

          input[type="submit"] {
              background-color: #006400;
              color: white;
              padding: 12px;
              border: none;
              border-radius: 6px;
              font-size: 16px;
              cursor: pointer;
              text-align: center;
              transition: background-color 0.3s ease;
          }

          input[type="submit"]:hover {
              background-color: #004d00;
          }

          .btn-main {
              background-color: #ccffcc;
              color: #004d00;
              padding: 12px 24px;
              border: none;
              border-radius: 6px;
              font-size: 16px;
              font-weight: bold;
              text-decoration: none;
              text-transform: uppercase;
              transition: background-color 0.3s ease;
              display: inline-block;
              text-align: center;
          }

          .btn-main:hover {
              background-color: #b3ffb3;
          }

          p[style*="color:red"] {
              text-align: center;
              margin-bottom: 15px;
              font-weight: bold;
          }
      </style>
</head>
<body>
<div class="profile-container">
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>
<h1>Dane Twojego profilu</h1>
<form method="post">
  Imię:<input type="text" name="name" value="<%=user.getName()%>"><br>
  Nazwisko:<input type="text" name="surname" value="<%=user.getSurname()%>"><br>
  Login:<input type="text" value="<%=user.getLogin()%>" readonly><br>
  Hasło:<input type="text" name="password" placeholder="Wpisz nowe hasło"><br>
  Telefon:<input type="text" name="phone_number" value="<%=user.getPhone_number()%>"><br>
  Adres:<input type="text" name="adress" value="<%=user.getAdress()%>"><br>
  <input type="submit" value="Zapisz zmiany">
  <h2>Kliknij poniżej jeśli chcesz wrócić do strony głównej</h2>
  <a href="index.jsp" class="btn-main">Strona główna</a>
</form>
</div>
</body>
</html>
