<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz Rejestracji Rypka</title>
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
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            display: flex;
            flex-direction: column;
        }
        .form-wrap {
            background-color: #90ee90; /* zielony */
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #006400; /* ciemnozielony */
        }

        form input[type="text"],
        form input[type="password"] {
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        form input[type="submit"] {
            padding: 12px;
            background-color: #006400; /* ciemnozielony */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #004d00; /* jeszcze ciemniejszy zielony */
        }

        p[style*="color:red"] {
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="form-wrap">
<h1>Rejestracja</h1>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
<p style="color:red;"><%= error %></p>
<% } %>
<form action="hello-servlet" method="post">
    Wpisz login: <input type="text" name="login" maxlength="20" minlength="5" />
    Wpisz hasło: <input type="password" name="password" maxlength="20" minlength="6" />
    Wpisz imię: <input type="text" name="name" maxlength="14" minlength="4" />
    Wpisz nazwisko: <input type="text" name="surname" maxlength="30" minlength="4" />
    <input type="submit" value="Wyślij">
</form>
</div>
</body>
</html>