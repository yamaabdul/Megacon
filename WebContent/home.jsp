<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="megacon.dal.*"%>  
<jsp:include page="headermenu.jsp" />
<%
String errormsg = request.getParameter("error");
String msg = request.getParameter("msg");
if(errormsg  == null) errormsg = "";
if(msg  == null) msg = "";

Medewerker user = (Medewerker) session.getAttribute("Medewerker");
RequestDispatcher rd;
if(user == null)
{
	rd = getServletContext().getRequestDispatcher("/login.jsp?error=Eerst aanmelden aub.&link=home.jsp");
	rd.forward(request, response);
	return;
}
out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
 
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/dailogbox.css"	media="screen" />
<link rel="stylesheet" type="text/css" href="css/style2.css" media="screen"/>
</head>
<body>
	<div id="white-background">
	</div>
		
	<table id="tile_table">
    <tr>
        <td><div class="tile"><a href=newProject.jsp><img class="tile" alt="" src="images/home.png">
        		<h3 style="color:white;">Nieuw project</h3></a>
        	</div>
        </td>
    </tr>
</table>

<jsp:include page="footer.jsp" />
</body>
</html>
 