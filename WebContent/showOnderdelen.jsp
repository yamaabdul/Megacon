
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
    <script type="text/javascript">
        $(document).ready(function () {
            var employees = [{ "ID": "1", "Pos": "A", "Aant": "1", "Type": "Romp", "Hoog/dia": "3024" , "Dikte": "12", "Breedte": "", "Lengte": "2300", "Bruto.gew": "2127,0", "Netto.gew": "2089,3","verfopp": "21,9","prijs": "0,90" ,"unit": "Eur/kg" ,"euro": "1914,31","materiaal": "S355J2G3","cert": "3.1.B","bsg": "8,00" 
            	,"bw": "1,7", "br": "1,7","wals": "3,2","assemb": "13,1", "lassen": "", "uml": "", "kotteren": "","dr": "", "proj": "", "tot": "21,0", "brm": "23,7", "brschuin": "", "zaag": "", "buur": "", "lascat": "3", "las1": "", "lasmtr1": "9,6", "inhd1": "", "lashr1": ""
            		, "las2": "", "lasmtr2": "2,3", "inhd2": "", "lashr2": "", "las3": "", "lasmtr3": "", "inhd3": "", "lashr3": "", "gaten": ""}, 
           
                             { "ID": "2", "Pos": "A", "Aant": "1", "Type": "Plaat romp", "Hoog/dia": "" , "Dikte": "12", "Breedte": "2320", "Lengte": "9550", "Bruto.gew": "", "Netto.gew": "","verfopp": "","prijs": "" ,"unit": "Eur/kg" ,"euro": "","materiaal": "S355J2G3","cert": "3.1.B","bsg": "8,00"
                            	 ,"bw": "", "br": "","wals": "","assemb": "", "lassen": "", "uml": "", "kotteren": "","dr": "", "proj": "", "tot": "", "brm": "", "brschuin": "", "zaag": "", "buur": "", "lascat": "", "las1": "", "lasmtr1": "", "inhd1": "", "lashr1": ""
                             		, "las2": "", "lasmtr2": "", "inhd2": "", "lashr2": "", "las3": "", "lasmtr3": "", "inhd3": "", "lashr3": "", "gaten": ""}];
                             
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
                    { name: 'Netto.gew', type: 'string' },
                    { name: 'verfopp', type: 'string' },
                    { name: 'prijs', type: 'string' },
                    { name: 'unit', type: 'string' },
                    { name: 'euro', type: 'string' },
                    { name: 'materiaal', type: 'string' },
                    { name: 'cert', type: 'string' },
                    { name: 'bsg', type: 'string' },
                    { name: 'bw', type: 'string' },
                    { name: 'br', type: 'string' },
                    { name: 'wals', type: 'string' },
                    { name: 'assemb', type: 'string' },
                    { name: 'lassen', type: 'string' },
                    { name: 'uml', type: 'string' },
                    { name: 'kotteren', type: 'string' },
                    { name: 'dr', type: 'string' },
                    { name: 'proj', type: 'string' },
                    { name: 'tot', type: 'string' },
                    { name: 'brm', type: 'string' },
                    { name: 'brschuin', type: 'string' },
                    { name: 'zaag', type: 'string' },
                    { name: 'buur', type: 'string' },
                    { name: 'lascat', type: 'string' },
                    { name: 'las1', type: 'string' },
                    { name: 'lasmtr1', type: 'string' },
                    { name: 'inhd1', type: 'string' },
                    { name: 'lashr1', type: 'string' },
                    { name: 'las2', type: 'string' },
                    { name: 'lasmtr2', type: 'string' },
                    { name: 'inhd2', type: 'string' },
                    { name: 'lashr2', type: 'string' },
                    { name: 'las3', type: 'string' },
                    { name: 'lasmtr3', type: 'string' },
                    { name: 'inhd3', type: 'string' },
                    { name: 'lashr3', type: 'string' },
                    { name: 'gaten', type: 'string' }
                ],
           
                id: 'ID',
                localData: employees
            };
            
            
            var linkrenderer = function (row, column, value) {
            return "<a href='editOnderdeel.jsp'>" + value + "</a>";
        	};
        	
            var dataAdapter = new $.jqx.dataAdapter(source);
            // create Tree Grid
            $("#treeGrid").jqxTreeGrid(
            {
                width: 3020,
                source: dataAdapter,
                selectionmode:'singlerow',
                editable: true,
             
                columns: [
				  { text: 'ID', dataField: 'ID', width: 50, cellsrenderer: linkrenderer },
                  { text: 'Pos', dataField: 'Pos', width: 50 },
                  { text: 'Aant', dataField: 'Aant', width: 50 },
                  { text: 'Onderdeel/subonderdeel', dataField: 'Type', width: 100 },
                  { text: 'Hoog/dia', dataField: 'Hoog/dia', width: 70 },
                  { text: 'Dikte', dataField: 'Dikte', width: 50 },
                  { text: 'Breedte', dataField: 'Breedte', width: 60 },
                  { text: 'Lengte', dataField: 'Lengte', width: 50 },
                  { text: 'Bruto.gew', dataField: 'Bruto.gew', width: 70 },
                  { text: 'Netto.gew', dataField: 'Netto.gew', width: 70 },
                  { text: 'Verf opp', dataField: 'verfopp', width: 60 },
                  { text: 'Prijs/unit', dataField: 'prijs', width: 70 },
                  { text: 'Unit', dataField: 'unit', width: 50 },
                  { text: 'Prijs/Euro', dataField: 'euro', width: 70 },
                  { text: 'Materiaal', dataField: 'materiaal', width: 70 },
                  { text: 'Cert.', dataField: 'cert', width: 50 },
                  { text: 'Bruto s.g.', dataField: 'bsg', width: 50 },
                  { text: 'BW', dataField: 'bw', width: 30 },
                  { text: 'BR', dataField: 'br', width: 30 },
                  { text: 'Wals', dataField: 'wals', width: 50 },
                  { text: 'Assemb', dataField: 'assemb', width: 60 },
                  { text: 'Lassen', dataField: 'lassen', width: 50 },
                  { text: 'UM-Las', dataField: 'uml', width: 50 },
                  { text: 'Kotteren', dataField: 'kotteren', width: 60 },
                  { text: 'Dr/frezen', dataField: 'dr', width: 70 },
                  { text: 'Proj./wvb', dataField: 'proj', width: 70 },
                  { text: 'Tot.uren', dataField: 'tot', width: 70 },
                  { text: 'br. M1 recht', dataField: 'brm', width: 80 },
                  { text: 'br. M1 schuin', dataField: 'brschuin', width: 80 }, 
                  { text: 'Zaag uur', dataField: 'zaag', width: 80 },
                  { text: 'Boor uur', dataField: 'buur', width: 80 },
                  { text: 'Las cat', dataField: 'lascat', width: 80 },
                  { text: 'Las 1 type', dataField: 'las1', width: 80 },
                  { text: 'Las mtr', dataField: 'lasmtr1', width: 80 },
                  { text: 'Inh. cm3', dataField: 'inhd1', width: 80 },
                  { text: 'Las hrs', dataField: 'lashr1', width: 80 },
                  { text: 'Las 2 type', dataField: 'las2', width: 80 },
                  { text: 'Las mtr', dataField: 'lasmtr2', width: 80 },
                  { text: 'Inh. cm3', dataField: 'inhd2', width: 80 },
                  { text: 'Las hrs', dataField: 'lashr2', width: 80 },
                  { text: 'Las 3 type', dataField: 'las3', width: 80 },
                  { text: 'Las mtr', dataField: 'lasmtr3', width: 80 },
                  { text: 'Inh. cm3', dataField: 'inhd3', width: 80 },
                  { text: 'Las hrs', dataField: 'lashr3', width: 80 },
                  { text: 'Aant. gaten', dataField: 'gaten', width: 80 } 
                ]
            });
        });
    </script>
</head>
<body class='default'>
<form method=post action=onderdeel.jsp name=div0>
<h1>Detail overzicht van onderdelen</h1>
<table>
<tr><td>Project:</td>
<td><input name=projectNaam maxlength=6 type=text  readonly maxlength=30 size=30 value='Tata S-BOCH OXYii' style="background-color:Lavender; color:black;"></td></tr>
<tr><td>Status:</td> 
			<td>
			<select style="width:242px";>
			  <option value="0">Nieuw</option>
		  	  <option value="1">Gecalculeerd</option>
			  <option value="2">Geaccepteerd</option>
			  <option value="3">Geweigerd</option>
			  <option value="4">Geannuleerd</option>
			</select>
		</td></tr>
     	<tr><td>Referentienummer:</td><td><input name=referentienummer type=text   maxlength=30 size=30 value='C-4483' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Klant:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata Steel' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Datum:</td><td><input name=datum  type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"><br></td></tr>
	    <tr><td>Component:</td><td><input name=componentNaam type=text readonly maxlength=30 size=30 value='S-BOCHT' style="background-color:Lavender; color:black;" ></td></tr>
	    <tr><td>Tekeningnummer:</td><td><input name=tekeningnr type=text readonly maxlength=30 size=30 value='F82872' style="background-color:Lavender; color:black;"></td></tr>
 		<tr><td>Aantal:</td><td><input name=aantal type=number min="1" style="background-color:Lavender; color:black; width:30px;" maxlength=2 value='1'></td></tr>
</table>
    <div id="treeGrid">
    </div>
    <tr><td><br><br><br><br><input type=submit value="Toevoegen onderdeel" class=button4></td></tr>
    <tr><td><button type="button" onclick="location.href='showComponent.jsp';" class=button4>Opslaan</button></td></tr>
    </form>
</body>
</html>