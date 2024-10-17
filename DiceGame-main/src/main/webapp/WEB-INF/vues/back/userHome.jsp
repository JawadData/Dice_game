<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.bo.GameState" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game App</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/style/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Georgia', serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h4 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            text-align: center;
        }
        p {
            color: #666;
            font-size: 18px;
            margin-bottom: 20px;
        }
        form {
            text-align: center;
        }
        label {
            font-weight: bold;
            color: #333;
        }
        .form-control {
            width: 200px;
            margin: 0 auto;
            display: block;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            color: #333;
        }
        .btn-primary {
            background-color: #333;
            border: none;
            color: #fff;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-primary:hover {
            background-color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            color: #333;
            font-size: 18px;
            text-align: center;
        }
        th {
            background-color: #333;
            color: #fff;
            padding: 15px;
            font-size: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Image above the "Utilisateur connecté" heading and centered -->
    <div style="text-align: center;">
        <img src="${pageContext.request.contextPath}/images/diceimage.png" alt="Dice Image" style="width: 200px;">
    </div>

    <h4 style="text-align: center;">Utilisateur connecté: <c:out value="${sessionScope.gameState.user.nom}"/></h4>
    
    <p>Entrez le numéro du dé à lancer, puis cliquez sur le bouton ci-dessous :</p>
    <form action="${pageContext.request.contextPath}/back/GameServlet" method="POST">
        <label for="diceNumber">Numéro de dé :</label>
        <select name="diceNumber" class="form-control" required>
            <option value="none">Choisissez un dé</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        <button type="submit" class="btn btn-primary">Lancer le dé</button>
    </form>

    <table>
        <thead>
        <tr>
            <th>Dé</th>
            <th>Résultat</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.dices}" var="dice">
            <tr>
                <td>${dice.getDiceNumber()}</td>
                <td>${dice.getDiceResult()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>