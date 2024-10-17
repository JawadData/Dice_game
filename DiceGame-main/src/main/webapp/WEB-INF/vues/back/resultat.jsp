<%@ page import="com.bo.GameState" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/style/result.css" rel="stylesheet">
<html>
<head>
    <meta charset="UTF-8">
    <title>Game App</title>
    <style>
        body {
            font-family: Georgia, serif; /* Georgia, serif font */
            margin: 0;
            padding: 0;
            background-color: #D3D3D3; /* LightGrey background */
            color: #333; /* Text color */
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff; /* White container background */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow effect */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #f9f9f9; /* Table background color */
            border: 1px solid #ddd; /* Light grey border */
        }
        table td, table th {
            padding: 8px;
            border: 1px solid #ddd;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        nav ul li a {
            text-decoration: none;
            color: #333; /* Text color */
        }
        nav ul li a:hover {
            color: #ff6b6b; /* Hover color */
        }
        h1 {
            text-align: center;
            font-size: 24px; /* Larger heading font size */
            font-weight: bold;
            margin-bottom: 20px;
            text-decoration: underline; /* Underline */
            color: #000; /* Heading color */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Partie Terminée !!</h1> <!-- Partie Terminée !! in bold and underlined -->
    <% 
        GameState gameState = (GameState) request.getSession().getAttribute("gameState");
        if (gameState != null && gameState.getUser() != null) {
            out.print("Mon score: " + Math.max(gameState.getUser().getBestScore(), gameState.getUser().getScore()));
        }
    %>

    <table>
        <c:forEach items="${sessionScope.dices}" var="dices">
            <tr>
                <td>Dice n°${dices.getDiceNumber()}=${dices.getDiceResult()}</td>
            </tr>
        </c:forEach>
    </table>

    <% session.removeAttribute("dices"); %>

    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/back/bestScore"><i class="fas fa-trophy"></i> Meilleurs scores</a></li>
            <li><a href="${pageContext.request.contextPath}/back/ReinitGameServlet"><i class="fas fa-redo"></i> Réinitialiser le jeu</a></li>
            <li><a href="${pageContext.request.contextPath}/DeconnectServlet"><i class="fas fa-sign-out-alt"></i> Se déconnecter</a></li>
        </ul>
    </nav>
</div>

</body>
</html>
