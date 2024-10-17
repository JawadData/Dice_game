<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.bo.Message" %>
<%@page import="java.util.List" %>
<%@page import="com.bo.GameState" %>
<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>App Game</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/style/signin.css" rel="stylesheet">

    <style>
        body {
            background-color: LightGrey; /* Changed background color to LightGrey */
            font-family: Georgia, serif;
            color: #000; /* Changed text color to black */
        }
        .container {
            margin-top: 7%;
        }
        h3 {
            text-align: center;
            font-size: 30px; /* Increased font size */
            color: #000; /* Darker shade on hover */
            font-weight: bold; /* Added font weight */
            text-decoration: underline; /* Added underline */
        }
        .form-signin {
            max-width: 400px; /* Adjusted width */
            margin: 0 auto;
            background-color: #fff; /* White background */
            padding: 20px;
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }
        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            margin-bottom: 10px;
        }
        .btn-primary {
            background-color: black; /* DarkSalmon */
            border-color: black; /* DarkSalmon */
        }
        .btn-primary:hover {
            background-color: #025A7D; /* Darker shade on hover */
            border-color: #025A7D; /* Darker shade on hover */
        }
        .create-account {
            text-align: center;
            margin-top: 10px;
        }
        .create-account a {
            color: #0477A6; /* Darker shade on hover */
            text-decoration: none;
        }
        .create-account a:hover {
            text-decoration: underline; /* Added underline on hover */
        }
        .message-list li {
            list-style-type: none; /* Remove bullet points */
            margin-bottom: 5px;
        }
        .message-list .warn {
            color: #b02f2f; /* Warning message color */
        }
        .message-list .info {
            color: #1caf1c; /* Info message color */
        }
        .message-list .error {
            color: #b02f2f; /* Error message color */
        }
    </style>
</head>

<body>
<h3>Connection</h3>
<div class="container">
    <form class="form-signin" method="POST" action="${pageContext.request.contextPath}/LoginServlet">

        <label for="inputEmail" class="sr-only">Login</label>
        <input type="text" class="form-control" placeholder="Login" required autofocus name="login">

        <label for="inputPassword" class="sr-only">Mot de passe</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Se connecter</button>

        <div class="create-account">
            <a href="${pageContext.request.contextPath}/UserManagementServlet?create">Créer un nouveau compte</a>
        </div>
    </form>

    <div class="message-list">
        <ul>
            <c:forEach items="${requestScope.messages}" var="msg">
                <li class="${msg.type}">${msg.text}</li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
