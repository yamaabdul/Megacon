
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="megacon.dal.Medewerker"%>
<jsp:include page="headermenu.jsp" />
<%
Medewerker user = (Medewerker)session.getAttribute("Medewerker");
if(session.getAttribute("Medewerker") == null)
{
	RequestDispatcher rd;
	rd = getServletContext().getRequestDispatcher("/login.jsp?error=Niet aangemeld of geen authorisatie&link=editOnderdeel.jsp");
	rd.forward(request, response);
}

out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Onderdeel</title>
</head>
<body>
  <h3>Onderdeel</h3><p><br><br>
	    <form method=post action=OnderdeelServlet>
	    <table>
	    <tr><td>Onderdeel ID:</td><td><input name=onderdeel_id maxlength=7 type=text readonly maxlength=30 size=30 value=''></td></tr>
	    <tr><td>Component ID:</td><td><input name=component_id maxlength=100 type=text maxlength=30 size=30 value=''></td></tr>
	    <tr><td>Standaardonderdeel ID:</td><td><input name=staandardOnderdeel_id maxlength=11 type=text size=30 value=''></td></tr>
	    <tr><td>onderdeelnaam:</td><td><input name=onderdeelnaam maxlength=7 type=text maxlength=30 size=30 value=''></td></tr>
	    <tr><td>positie:</td><td><input name=positie maxlength=7 type=text  maxlength=30 size=30 value=''></td></tr>
		<tr><td>aantal:</td><td><input name=aantal maxlength=7 type=text  maxlength=30 size=30 value=''></td></tr>
		<tr><td>isActief:</td><td><input name=isActief maxlength=7 type=text  maxlength=30 size=30 value=''></td></tr>
	 
		<tr>
			<td>Notitie:</td>
			<td><textarea class=txt rows=3 style="width:372px;" name=notitie> </textarea></td>
		</tr>
  <tr><td></td><td><br><input type=submit value=Opslaan class=button> <input type=reset class=button></td></tr>
</body>
</html>