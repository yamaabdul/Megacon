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
  <h1>Component toevoegen</h1><p><br><br>
 <form method=post action=onderdeel.jsp name=div0>
	   <table>
	    <tr><td>Project:</td>
	    <td><input name=projectNaam type=text readonly maxlength=30 size=30 value='Tata S-BOCH OXYii' style="background-color:Lavender; color:black;"></td></tr>
		<tr><td>Status:</td> 
			<td>
			<select style="width:242px";>
			  <option value="0">Nieuw</option>
			  <option value="1">Geaccepteerd</option>
			  <option value="2">Geweigerd</option>
			  <option value="3">Geannuleerd</option>
			</select>
		</td></tr>
	    <tr><td>Referentienummer:</td><td><input name=referentienummer type=text readonly  maxlength=30 size=30 value='C-4483' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Klant:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata Steel' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Datum:</td><td><input name=datum type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"><br></td></tr>
	    <tr><td>Component:</td><td><input name=componentNaam type=text required maxlength=30 size=30 value=''></td></tr>
	    <tr><td>Tekeningnummer:</td><td><input name=tekeningnr type=text required maxlength=30 size=30 value=''></td></tr>
	    <tr><td>Aantal:</td><td><input name=aantal type=number min="1" style="width:30px;"  maxlength=10 value='1'>
		<tr><td></td><td><br><br><br><br><br><br><input type=submit value=Toevoeging class=button> <input type=reset class=button></td></tr>
 						

</table>
</form>
</body>
</html>
<%}%>
<jsp:include page="footer.jsp" />