<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input</title>
    </head>
    <header>
        <center><h1>Dollar Exchanger</h1></center>
    </header>
    <body>
        <form action="results.jsp" method="POST">
            <center><b>How much would you like to exchange?</b></center>
            <br>
            <center><input type="text" name="Amount" value="" /></center>
            <br>
            <center><small>1.00 Php = $0.021 USD</small></center>
            <br>
            <center><input type="submit" value="Exchange >" name="Convert" /></center>
        </form>
    </body>
    <footer>
        <br>
        <b>Comments? Suggestions? Email us.</b>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
    </footer>
</html>
