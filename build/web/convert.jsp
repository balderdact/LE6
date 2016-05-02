<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input</title>
    </head>
    <body>
        <h1>Peso to US Dollar Converter</h1>
        <br>
        <form action="header_footer.jsp" method="POST">
        <b>Amount:</b> &nbsp; &nbsp; &nbsp; <input type="text" name="Amount" value="" />
        <br><br>
        <small>1 Philippine Peso equals 0.021 US Dollars</small>
        <br><br>
        <input type="submit" value="Convert" name="Convert" />
        </form>
    </body>
</html>
