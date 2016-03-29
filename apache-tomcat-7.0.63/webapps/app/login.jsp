<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SMUA | Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/signin.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div style="text-align: center">
            <img src="img/smu.png" alt="Analytics" style="width:304px;height:relative;">
        </div>
        <div class="container">
            <form class="form-signin" action="AuthenticateLogin" method="get">
                <h1 class="form-signin-heading"><center>SMUAnalytics</center></h1>
                <p style="text-align: center; color: red; font-size: 130%">
                    <%
                        String logoutStatus = request.getParameter("logout");
                        String invalidLoginStatus = request.getParameter("login");
                        if (logoutStatus != null && logoutStatus.equals("true")) {
                            out.println("You Have Successfully Logged Out");
                        } else if (invalidLoginStatus != null && invalidLoginStatus.equals("false")) {
                            out.println("Invalid Email and/or Password");
                        }
                    %>
                </p>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="text" name="emailId" id="inputEmail" class="form-control" placeholder="Email ID" required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div> <!-- /container -->
    </body>
</html>
