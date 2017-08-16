
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
	width:180px;
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
            var employees = [{ "ID": "1", "comp": "S-BOCHT", "aant": "1", "teken": "F82872"},{ "ID": "2", "comp": "COMPENSATOR", "aant": "1", "teken": "F965432"}];
                             
            // prepare the data
            var source =
            {
                dataType: "json",
                dataFields: [
                    { name: 'ID', type: 'number' },
                    { name: 'comp', type: 'string' },
                    { name: 'aant', type: 'string' },
                    { name: 'teken', type: 'string' }         
                ],
           
                ID: 'ID',
                localData: employees
            };
            
            var linkrenderer = function (row, column, value) {
            return "<a href='showComponent.jsp'>" + value + "</a>";
        	};
            var dataAdapter = new $.jqx.dataAdapter(source);
            // create Tree Grid
            $("#treeGrid").jqxTreeGrid(
            {
                width: 360,
                source: dataAdapter,
             
                columns: [
				  { text: 'ID', dataField: 'ID', width: 50, cellsrenderer: linkrenderer },
                  { text: 'Component', dataField: 'comp', width: 150 },
                  { text: 'Aantal', dataField: 'aant', width: 70 },
                  { text: 'Tekening', dataField: 'teken', width: 90 }
                ]
            });
        });
    </script>
</head>
<body class='default'>
<form method=post action=showProject.jsp name=div0>
<h1>Overzicht Componenten</h1>
<table>
<tr><td>Project:</td>
<td><input name=projectNaam maxlength=6 type=text  readonly maxlength=30 size=30 value='Tata S-BOCH OXYii' style="background-color:Lavender; color:black;"></td></tr>
<tr><td>Status:</td> 
			<td>
			<select style="width:242px";>
		  	  <option value="0">Gecalculeerd</option>
			  <option value="1">Geaccepteerd</option>
			  <option value="2">Geweigerd</option>
			  <option value="3">Geannuleerd</option>
			</select>
		</td></tr>
     	<tr><td>Referentienummer:</td><td><input name=referentienummer type=text   maxlength=30 size=30 value='C-4483' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Klant:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata Steel' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Datum:</td><td><input name=datum  type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td><br><br><br><br></td></tr>
	    
</table>

    <div id="treeGrid">
    </div>
   <table>
   <tr><td><br><button type="button" onclick="location.href='newComponent.jsp';" class=button4>Toevoegen component</button></td></tr>
   <tr><td><input type=submit value="Opslaan" class=button4></td></tr>
   </table> 
    
    </form>
</body>
</html>