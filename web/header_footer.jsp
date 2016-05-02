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
        <h3><i>Peso to US Dollar Converter</i></h3>
    </header>
    <body>
    <%@ page import="java.text.DecimalFormat"%>    
    <%
        DecimalFormat df = new DecimalFormat("#.##");
        double pesos = Double.parseDouble(request.getParameter("Amount"));
        session.setAttribute("pesos", pesos);
        String dollars = df.format(pesos * 0.021);
        session.setAttribute("dollars", dollars);
        String name = getServletConfig().getInitParameter("Name");
        session.setAttribute("name", name);
        String total = (String) session.getAttribute("total");
        if (total == null) {
            total = dollars;
        } else {
            total = df.format(Double.parseDouble(total) + Double.parseDouble(dollars));
        }
        session.setAttribute("total", total);
    %>
    ${pesos} Philippine Pesos = ${pesos} * 0.021 = <b>${dollars} US Dollars</b>
    <br><br>
    <b>Total Dollars Converted: </b> ${total}
    </body>
    <footer>
        <br>
        <b>Username: </b><jsp:getProperty name="user" property="username"/><br/>
        <b>Name: </b>${name}
    </footer>
    <br><br>
    <form action="convert.jsp" method="POST">
        <input type="submit" value="Try Again" name="Try Again" />
    </form>
</html>
