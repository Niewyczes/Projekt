
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Logowanie</title>
    <style>
            body {
                background-color: lightyellow;
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-wrapper {
                background-color: #ccffcc; /* jasnozielone tło */
                padding: 30px 40px;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }

            h1 {
                color: darkgreen;
                font-family: "Bodoni MT", serif;
                margin-bottom: 20px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
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
            }

            input[type="submit"]:hover {
                background-color: #004d00;
            }

            .error {
                color: red;
                margin-bottom: 10px;
            }
        </style>
</head>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>
<body>
<title>Formularz logowania</title>
<h1> Zaloguj się</h1>
<form action="login-servlet" method="post">
Wpisz login: <input type="text" name="login"/>
Wpisz hasło: <input type="password" name="haslo"/>
<input type="submit" value="Wyślij">
</form>
</body>
</html>
