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
    
    <!-- Custom CSS -->
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
            color: #000; /* Changed color to black */
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
            background-color: black; /* Changed button color to black */
            border-color: black; /* Changed border color to black */
            color: white; /* Changed text color to white */
        }
        .btn-primary:hover {
            background-color: #025A7D; /* Darker shade on hover */
            border-color: #025A7D; /* Darker shade on hover */
        }
    </style>

</head>
<body>
<h3>Inscription</h3>
<div class="container">
    <form class="form-signin" method="POST" action="${pageContext.request.contextPath}/UserManagementServlet">

        <label for="inputName" class="sr-only">Nom</label>
        <input type="text" class="form-control" placeholder="Entrez votre nom" required autofocus name="nom">
        <small class="form-text text-muted">Veuillez entrer votre nom complet</small>

        <label for="inputEmail" class="sr-only">Login</label>
        <input type="text" class="form-control" placeholder="Login" required autofocus name="login">

        <label for="inputPassword" class="sr-only">Mot de passe</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Entrez votre password" name="password" required>

        <button class="btn btn-lg btn-primary btn-block" type="submit">S'inscrire</button>

    </form>
</div>
</body>
</html>
