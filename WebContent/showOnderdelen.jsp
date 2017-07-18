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


<html lang="en">
<head>
    <title id="Description">TreeGrid displaying JSON data</title>
    <link rel="stylesheet" href="css/jqx.base.css" type="text/css" />
 <script type="text/javascript" src="script/jquery-1.11.1.min.js"></script>
     <script type="text/javascript" src="script/jqwidgets/scripts/jqxcore.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxdatatable.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxtreegrid.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var employees = [{ "ID": "1", "Pos": "A", "Aant": "1", "Type": "Romp", "Hoog/dia": "3024" , "Dikte": "12", "Breedte": "", "Lengte": "2300", "Bruto.gew": "2127,0", "Netto.gew": "2089,3" }, 
                             { "ID": "2", "Pos": "A", "Aant": "1", "Type": "Plaat romp", "Hoog/dia": "" , "Dikte": "12", "Breedte": "2320", "Lengte": "9550", "Bruto.gew": "", "Netto.gew": "" }];
            // prepare the data
            var source =
            {
                dataType: "json",
                dataFields: [
                    { name: 'ID', type: 'string' },
                    { name: 'Pos', type: 'string' },
                    { name: 'Aant', type: 'number' },
                    { name: 'Type', type: 'string' },
                    { name: 'Hoog/dia', type: 'string' },
                    { name: 'Dikte', type: 'string' },
                    { name: 'Breedte', type: 'string' },
                    { name: 'Lengte', type: 'string' },
                    { name: 'Bruto.gew', type: 'string' },
                    { name: 'Netto.gew', type: 'string' }
                ],
           
                id: 'EmployeeID',
                localData: employees
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            // create Tree Grid
            $("#treeGrid").jqxTreeGrid(
            {
                width: 550,
                source: dataAdapter,
             
                columns: [
				  { text: 'ID', dataField: 'ID', width: 50 },
                  { text: 'Pos', dataField: 'Pos', width: 50 },
                  { text: 'Aant', dataField: 'Aant', width: 50 },
                  { text: 'Type', dataField: 'Type', width: 100 },
                  { text: 'Hoog/dia', dataField: 'Hoog/dia', width: 50 },
                  { text: 'Dikte', dataField: 'Dikte', width: 50 },
                  { text: 'Breedte', dataField: 'Breedte', width: 50 },
                  { text: 'Lengte', dataField: 'Lengte', width: 50 },
                  { text: 'Bruto.gew', dataField: 'Bruto.gew', width: 50 },
                  { text: 'Netto.gew', dataField: 'Netto.gew', width: 50 }
                ]
            });
        });
    </script>
</head>
<body class='default'>
    <div id="treeGrid">
    </div>
</body>
</html>