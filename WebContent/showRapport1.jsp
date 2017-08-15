
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(Calendar.getInstance().getTime());
out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
%>


<html lang="en">
<head>
    <title id="Description">TreeGrid displaying JSON data</title>
    <link rel="stylesheet" href="css/jqx.base.css" type="text/css" />
    <style type="text/css">
    .button4 {
	background-color:#ffffff;
	-webkit-border-top-left-radius:1px;
	-moz-border-radius-topleft:1px;
	border-top-left-radius:1px;
	-webkit-border-top-right-radius:1px;
	-moz-border-radius-topright:1px;
	border-top-right-radius:1px;
	-webkit-border-bottom-right-radius:1px;
	-moz-border-radius-bottomright:1px;
	border-bottom-right-radius:1px;
	-webkit-border-bottom-left-radius:1px;
	-moz-border-radius-bottomleft:1px;
	border-bottom-left-radius:1px;
	border: 1px solid rgba(91, 121, 150, .3);
	display:inline-block;
	color:#505050;
	font-size:14px;
	font-weight:400;
	height:30px;
	width:150px;
	text-decoration:none;
	text-align:center;
	margin-left: auto;
    margin-right: auto;
    display: block;
    cursor: pointer;
    -webkit-transition: all 0.2s ease-in-out;
    -moz-transition: all 0.2s ease-in-out;
    -o-transition: all 0.2s ease-in-out;
    transition: all 0.2s ease-in-out;
}

.button:hover {
	box-shadow: 2px 2px 30px rgba(0, 0, 0, .3);;
}

.button:active {
	position: relative;
	box-shadow: 2px 2px 30px rgba(0, 0, 0, .2);
}

.button:focus {
	outline:0 !important;
	}</style>
 <script type="text/javascript" src="script/jquery-1.11.1.min.js"></script>
     <script type="text/javascript" src="script/jqwidgets/scripts/jqxcore.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxdatatable.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxtreegrid.js"></script>
    <script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxcore.js"></script>
	<script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxlistbox.js"></script>
	<script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxdropdownlist.js"></script>
	<script type="text/javascript" src="script/jqwidgets/jqwidgets/jqxdata.export.js"></script>
	<script type="text/javascript" src="script/dialogboxscript.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
        	   var employees = [{ "ID": "1", "pr": "TATA S-BOCHT OXYii", "status": "Gecalculeerd", "ref": "C-4483", "klant": "Tata Steel" , "med": "Ruud van Schinkel", "date": "26-07-2017"}];
                                
               // prepare the data
               var source =
               {
                   dataType: "json",
                   dataFields: [
                       { name: 'ID', type: 'number' },
                       { name: 'pr', type: 'string' },
                       { name: 'status', type: 'string' },
                       { name: 'ref', type: 'string' },
                       { name: 'klant', type: 'string' },
                       { name: 'med', type: 'string' },
                       { name: 'date', type: 'string' }        
                   ],
              
                   ID: 'ID',
                   localData: employees
               };
               
               var linkrenderer = function (row, column, value) {
               return "<a href='showRapportage.jsp'>" + value + "</a>";
           	};
               var dataAdapter = new $.jqx.dataAdapter(source);
               // create Tree Grid
               $("#treeGrid").jqxTreeGrid(
               {
                   width: 950,
                   source: dataAdapter,
                
                   columns: [
   				  { text: 'ID', dataField: 'ID', width: 50, cellsrenderer: linkrenderer },
                     { text: 'Project', dataField: 'pr', width: 150 },
                     { text: 'Status', dataField: 'status', width: 150 },
                     { text: 'Rferentienummer', dataField: 'ref', width: 150 },
                     { text: 'Klant', dataField: 'klant', width: 150 },
                     { text: 'Medewerker', dataField: 'med', width: 150 },
                     { text: 'Datum', dataField: 'date', width: 150 }
                ]
            });
        });
    </script>
</head>
<body class='default'>
<form method=post action=onderdeel.jsp name=div0>
<h1>Projectenoverzicht</h1>
<table>

</table>
    <div id="treeGrid">
    </div>
    <!-- <tr><td><br><br><br><br><input type=submit value="Voeg onderdeel" class=button4></td>
    <button type="button" onclick="location.href='http://localhost:8080/Megacon2/newComponent.jsp';" class=button4>Voeg component</button></tr> -->
    </form>
</body>
</html>