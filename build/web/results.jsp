<jsp:useBean id="user" class="pkg.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Converter</title>
    </head>
    <header>
        <font style="color:green; font-family:verdana;">
        Account: <b><jsp:getProperty name="user" property="username"/><br/></b>
        </font>
        <center><h1 style="color:green; font-family:verdana;">Dollar Exchanger</h1></center>
    </header>
    <body>
        <font style="color:green; font-family:verdana;">
    <%@ page import="java.text.DecimalFormat"%>    
    <%
        DecimalFormat df = new DecimalFormat("#.##");
        double pesos = Double.parseDouble(request.getParameter("Amount"));
        session.setAttribute("pesos", df.format(pesos));
        String dollars = df.format(pesos * 0.021);
        session.setAttribute("dollars", dollars);
        String name = getServletConfig().getInitParameter("Name");
        getServletContext().setAttribute("name", name);
        String total = (String) session.getAttribute("total");
        if (total == null) {
            total = dollars;
        } else {
            total = df.format(Double.parseDouble(total) + Double.parseDouble(dollars));
        }
        session.setAttribute("total", total);
    %>
    <center><b>${pesos} x 0.021</b>
    <br>
    <b>=</b>
    <br>
    <b>${dollars} USD</b>
    <br><br>
    <i>${dollars} USD has been added to your account.</i>
    <br><br>
    <i>Total dollars converted:</i> <br> ${total} </center>
    </font>
    </body>
    <br><br>
    <form action="convert.jsp" method="POST">
        <center><input type="submit" value="Convert" name="Try Again" /></center>
    </form>
    <form action="withdraw.jsp" method="POST">
        <center><input type="submit" value="Withdraw" name="Withdraw" /></center>
    </form>
    <form action="members.jsp" method="POST">
        <center><input type="submit" value="Members" name="Members" /></center>
    </form> 
    <form action="Controller" method="POST">
        <center><input type="submit" value="Log Out" name="logout" /></center>
    </form>
    <br><br>
    <footer>
        <center>
        <font style="color:green; font-family:verdana;">
        <b>Comments? Suggestions? Email us.</b>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
        <br>
        <small>2014069870@ust-ics.mygbiz.com</small>
        </font></center>
    </footer>
</html>