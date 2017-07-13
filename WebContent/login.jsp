<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="megacon.dal.Medewerker"%>
<%
Medewerker medew = (Medewerker) session.getAttribute("Medewerker");
String link = request.getParameter("link");
String errormsg = request.getParameter("error");
if(errormsg == null) errormsg = "";
%>
<jsp:include page="header.jsp" />

<body OnLoad='document.lg.id.focus();'>

<h2>Megacon Voorcalculatie | Login</h2>

<div class="centerwindow">
	<h1>Inloggen</h1>
		<form method=post action="LoginServlet" name=lg>
			<div class=error><%=errormsg %></div>
				<div class="inputs">
	        		<input class="field" name="id" type="text" placeholder="Gebruikersnaam" autofocus required>
	        		<input class="field" name="pw" type="password" placeholder="Wachtwoord" required>
				</div>
				<input type=submit class=button value='Log in'>
<%
if(link != null) 
	{
	out.print("<input type=hidden name=link value='"+link + "'>");
	out.print("<input type=hidden name=arg value='"+request.getParameter("arg") + "'>");
	}
%>
		</form>
</div>
<jsp:include page="footer.jsp" />