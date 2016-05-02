<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2>Login</h2>
        <form action="Controller" method="POST">
        <b>Username:</b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text" name="Username" value="" />
        <br><br>
        <b>Password:</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="password" name="Password" value="" />
        <br><br>
        <input type="submit" value="Submit" />
        </form>
    </body>
</html>
