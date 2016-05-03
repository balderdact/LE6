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
        <center><h1>Dollar Exchanger</h1></center>
    </header>
    <body>
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
    <br>
    <p>${dollars} USD has been added to your account.</p> 
    <br>
    <p>Total Dollars Converted: </p> ${total} </center>
    </body>
    <br><br>
    <form action="convert.jsp" method="POST">
        <center><input type="submit" value="Another transation? >" name="Try Again" /></center>
    </form>    
    <form action="Controller" method="POST">
        <center><input type="submit" value="Log out? >" name="logout" /></center>
    </form>
    <footer>
        <br>
        <b>Username: </b><jsp:getProperty name="user" property="username"/><br/>
        <b>Name: </b><%=name%>
        <br><br>
        <b>Comments? Suggestions? Email us.</b>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
    </footer>
</html>

