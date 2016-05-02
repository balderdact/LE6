
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
        String dollars = df.format(pesos * 0.021);
        String name = getServletConfig().getInitParameter("Name");
        String total = (String) session.getAttribute("total");
        if (total == null) {
            total = dollars;
        } else {
            total = df.format(Double.parseDouble(total) + Double.parseDouble(dollars));
        }
        session.setAttribute("total", total);
    %>
    <%=pesos%> Philippine Pesos = <%=pesos%> * 0.021 = <b><%=dollars%> US Dollars</b>
    <br><br>
    <b>Total Dollars Converted: </b> <%=total%>
    </body>
    <footer>
        <br>
        <b>Name: </b><%=name%>
    </footer>
    <br><br>
    <form action="convert.jsp" method="POST">
        <input type="submit" value="Try Again" name="Try Again" />
    </form>
</html>
