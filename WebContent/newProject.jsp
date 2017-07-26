<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="headermenu.jsp" />
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="megacon.dal.Medewerker"%>
<%
Medewerker user = (Medewerker)session.getAttribute("Medewerker");
if(session.getAttribute("Medewerker") == null)
{
	RequestDispatcher rd;
	rd = getServletContext().getRequestDispatcher("/login.jsp?error=Niet aangemeld of geen authorisatie&link=editOnderdeel.jsp");
	rd.forward(request, response);
}
else{ 
	int standaardOnderdeel_id = 0;
	try{standaardOnderdeel_id = Integer.parseInt(request.getParameter("standaardOnderdeel_id"));}
	catch(NumberFormatException numberformatexception) { }
	

	String eol            = "\r\n"; 
	String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(Calendar.getInstance().getTime());
	
out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nieuw Project</title>
</head>
<body>
  <h1>Nieuw project</h1><p><br><br>
 <form method=post action=newComponent.jsp name=div0>
	   <table>
	    <tr><td>Project:</td><td><input name=projectNaam  type=text  required maxlength=30 size=30 value=''></td></tr>
		<tr><td>Status:</td> 
			<td>
			<select style="width:242px"; required>
			  <option value="0">Nieuw</option>
			  <option value="1">Gecalculeerd</option>
			  <option value="2">Geaccepteerd</option>
			  <option value="3">Geweigerd</option>
			  <option value="4">Geannuleerd</option>
			</select>
		</td></tr>
	    <tr><td>Referentienummer:</td><td><input name=referentienummer type=text required  maxlength=30 size=30 value=''></td></tr>
	    <tr><td>Klant:</td> 
			<td>
			<select style="width:242px";>
			  <option value="0">--maak keuze--</option>
			  <option value="1">Tata Steel</option>
			  <option value="2">Blok Group</option>
			  <option value="3">Machinefabriek Adrichem</option>
			</select>
		</td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam maxlength=6 type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>'></td></tr>
	    <tr><td>Datum:</td><td><input name=datum maxlength=6 type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>'><br></td></tr>
						<tr><td></td><td><br><br><br><br><br><br><input type=submit value=Toevoegen class=button> <input type=reset class=button></td></tr>
 						

</table>
</form>
</body>
</html>
<%}%>
<jsp:include page="footer.jsp" />