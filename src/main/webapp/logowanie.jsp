
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Logowanie</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fffecb; /* jasnożółte tło */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #90ee90; /* jasna zieleń */
            padding: 30px 40px;
            border-radius: 12px;
            width: 100%;
            max-width: 400px;
            display: flex;
            place-items: center;
            flex-direction: column;
        }

        a {
            padding: 12px;
            background-color: #006400; /* ciemnozielony */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            margin-top: 10px;
        }

        a:hover {
            background-color: #004d00; /* jeszcze ciemniejszy zielony */
        }

        h1 {
            margin-bottom: 20px;
            color: #006400; /* ciemnozielony */
            font-family: "Bodoni MT", serif;
        }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 0 auto;
                display: grid;
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
    <a href="index.jsp"> Powrót do strony głównej</a>
</form>

</body>
</html>
