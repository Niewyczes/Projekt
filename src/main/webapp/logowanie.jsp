<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formularz logowania</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fffecb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #90ee90;
            padding: 30px 40px;
            border-radius: 12px;
            width: 100%;
            max-width: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #006400;
            font-family: "Bodoni MT", serif;
            text-align: center;
            width: 100%;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #66cc66;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: darkgreen;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004d00;
        }

        a {
            padding: 12px;
            background-color: #006400;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            margin-top: 10px;
            font-family: Arial, sans-serif;
        }

        a:hover {
            background-color: #004d00;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Zaloguj się</h1>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>

        <form action="login-servlet" method="post">
            <label>Wpisz login:</label>
            <input type="text" name="login" />

            <label>Wpisz hasło:</label>
            <input type="password" name="haslo" />

            <input type="submit" value="Wyślij">
            <a href="index.jsp">Powrót do strony głównej</a>
        </form>
    </div>
</body>
</html>
