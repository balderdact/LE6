<jsp:useBean id="user" class="pkg.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdrawal</title>
    </head>
    <header>
        <font style="color:green; font-family:verdana;">
        Account: <b><jsp:getProperty name="user" property="username"/><br/></b>
        </font>
        <center><h1 style="color:green; font-family:verdana;">Dollar Exchanger</h1></center>
    </header>
    <center><body>
        <font style="color:green; font-family:verdana;">
            <%@ page import="java.text.DecimalFormat"%> 
            <%
                DecimalFormat df = new DecimalFormat("#.##");
                double total = Double.parseDouble((String) session.getAttribute("total"));
                double withdraw = Double.parseDouble(request.getParameter("Withdraw Value"));
                String member = request.getParameter("Select Member");
                if (withdraw > total) {
                    out.println("<h3>Invalid Withdrawal</h3><br>");
                    out.println("You tried to withdraw "+df.format(withdraw)+ " USD with a balance of "+df.format(total)+" USD.");
                } else {
                    out.println(member+" has successfully withdrawn "+df.format(withdraw)+" USD from your account.");
                    out.println("<br><br>Your current balance is now: "+df.format(total - withdraw)+" USD");
                    session.setAttribute("total", df.format(total - withdraw));
                }
            %>
        </font>
    </body></center>
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
