<jsp:useBean id="user" class="pkg.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Members</title>
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
                out.println("<font style=\"color:green; font-family:verdana;\"><br>You have not added any members yet.</font>");
            } else {
                m = (HashSet<Member>) session.getAttribute("members");
                if (m.isEmpty()) {
                    out.println("<font style=\"color:green; font-family:verdana;\"><br>You have not added any members yet.</font>");
                } else {
                    out.println("<font style=\"color:green; font-family:verdana;\">");
                    out.println("<table border=\"1\" width=\"10%\"><tr><th>Members</th></tr>");
                    for (Member mem : m) {
                        out.println("<tr><td>"+mem.getName()+"</td></tr>");
                    }
                    out.println("</table></font>");
                }

            }
            if (request.getParameter("Add Member") != null) {
                String mem = request.getParameter("Add Member Name");
                if (!mem.equals("")) {
                    m.add(new Member(mem));
                    session.setAttribute("members", m);
                    out.println("<meta http-equiv=\"refresh\" content=\"0.1\">");
                }
            }
            if (request.getParameter("Delete Member") != null) {
                String mem = request.getParameter("Delete Member Name");
                if (!mem.equals("")) {
                    for (Member member : m) {
                        if (member.getName().equals(mem)) {
                            m.remove(member);
                            break;
                        }
                    }
                    session.setAttribute("members", m);
                    out.println("<meta http-equiv=\"refresh\" content=\"0.1\">");
                }
            }
        %>
        <br><br>
        <form action="members.jsp" method="POST">
            <input type="text" name="Add Member Name" value="" />
            <input type="submit" value="Add Member" name="Add Member" />
        </form>
        <br>
        <form action="members.jsp" method="POST">
            <input type="text" name="Delete Member Name" value="" />
            <input type="submit" value="Delete Member" name="Delete Member" />
        </form>
        <br>
        <form action="withdraw.jsp" method="POST">
            <center><input type="submit" value="Withdraw" name="Withdraw" /></center>
        </form>
        <form action="convert.jsp" method="POST">
            <center><input type="submit" value="Another Transation" name="Try Again" /></center>
        </form>
        <br><br><br>
    </body></center>
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
