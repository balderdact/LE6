<jsp:useBean id="user" class="pkg.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Withdraw</title>
    </head>
    <header>
        <font style="color:green; font-family:verdana;">
        Account: <b><jsp:getProperty name="user" property="username"/><br/></b>
        </font>
        <center><h1 style="color:green; font-family:verdana;">Dollar Exchanger</h1></center>
    </header>
    <center><body>
        <%@ page import="java.util.HashSet" %>
        <%@ page import="pkg.Member" %>
        <%
            HashSet<Member> m;
            if (session.getAttribute("members") == null) {
                m = new HashSet<Member>();
                out.println("<font style=\"color:green; font-family:verdana;\"><br>You have not added any members to select from yet.</font>");
            } else {
                m = (HashSet<Member>) session.getAttribute("members");
                if (m.isEmpty()) {
                    out.println("<font style=\"color:green; font-family:verdana;\"><br>You have not added any members to select from yet.</font>");
                } else {
                    out.println("<font style=\"color:green; font-family:verdana;\">");
                    out.println("<br> Select a member to withdraw with: ");
                    out.println("<select>");
                    for (Member mem : m) {
                        out.println("<option value=\""+mem.getName()+"\">"+mem.getName()+"</option>");
                    }
                    out.println("</select>");
                    out.println("<br><br><form action=\"results2.jsp\" method=\"POST\">");
                    out.println("<p>Input amount to withdraw: &nbsp;</p>");
                    out.println("<input type=\"text\" name=\"Withdraw Value\" value=\"\" />");
                    out.println("<input type=\"submit\" value=\"Withdraw\" name=\"Withdraw\" /></form></font>");
                }

            }
        %>
        <br><br>
        <form action="convert.jsp" method="POST">
            <center><input type="submit" value="Another Transation" name="Try Again" /></center>
        </form>
        <form action="members.jsp" method="POST">
            <center><input type="submit" value="Members" name="Members" /></center>
        </form> 
        <form action="Controller" method="POST">
            <center><input type="submit" value="Log Out" name="logout" /></center>
        </form>
    </body></center>
    <footer>
        <center>
        <font style="color:green; font-family:verdana;">
        <br><br><br>
        <b>Comments? Suggestions? Email us.</b>
        <br>
        <small>2014068453@ust-ics.mygbiz.com</small>
        <br>
        <small>2014069870@ust-ics.mygbiz.com</small>
        </font></center>
    </footer>
</html>
