<jsp:useBean id="user" class="pkg.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input</title>
    </head>
    <header>
        <font style="color:green; font-family:verdana;">
        Account: <b><jsp:getProperty name="user" property="username"/><br/></b>
        </font>
        <center><h1 style="color:green; font-family:verdana;">Dollar Exchanger</h1></center>
    </header>
    <body>
        <font style="color:green; font-family:verdana;">
        <form action="results.jsp" method="POST">
            <center>How much would you like to exchange?</center>
            <br>
            <center><input type="text" name="Amount" value="" /></center>
            <br>
            <center><small><i>1.00 Php = $0.021 USD</i></small></center>
            <br>
            <center><input type="submit" value="Exchange" name="Convert" /></center>
        </form>
        <form action="Controller" method="POST">
            <center><input type="submit" value="Log Out" name="logout" /></center>
        </form>
        </font>
    </body>
    <br><br>
    <footer>
        <center>
        <font style="color:green; font-family:verdana;">
        <br>
        <b>Comments? Suggestions? Email us.</b>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
        <br>
        <small>2014069870@ust-ics.mygbiz.com</small>
        </font></center>
    </footer>
</html>