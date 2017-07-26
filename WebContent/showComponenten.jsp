
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
            var employees = [{ "ID": "1", "Aant": "1", "Tekening": "F82872", "Component": "S-Bocht", "Uren": "14,05" , "Brut_gew": "2127", "Net_gew": "2089", "Ver_opp": "21,85", "Inkoop": "1914", "bw": "1,7","br": "1,7","wals": "3,18" ,"assemb": "21,41" ,"lassen": "","uml": "","kotteren": "","dr_frezen": "" 
            	,"proj_wvb": "1,37", "tot_uren": "29,36","bw_kosten": "1615","co_kosten": "191400", "last_kosten": "", "uitbest": "", "tekening": "104","transport": "2089", "kostprijs": "197123", "winst": "19712", "sga": "9775", "prijs": "226611", "kg": "108,46", "inh": "", "mtr": "11,87"}];
                             
            // prepare the data
            var source =
            {
                dataType: "json",
                dataFields: [
                    { name: 'ID', type: 'string' },
                    { name: 'Aant', type: 'string' },
                    { name: 'Tekening', type: 'string' },
                    { name: 'Component', type: 'string' },
                    { name: 'Uren', type: 'string' },
                    { name: 'Brut_gew', type: 'string' },
                    { name: 'Net_gew', type: 'string' },
                    { name: 'Ver_opp', type: 'string' },
                    { name: 'Inkoop', type: 'string' },
                    { name: 'bw', type: 'string' },
                    { name: 'br', type: 'string' },
                    { name: 'wals', type: 'string' },
                    { name: 'assemb', type: 'string' },
                    { name: 'lassen', type: 'string' },
                    { name: 'uml', type: 'string' },
                    { name: 'kotteren', type: 'string' },
                    { name: 'dr_frezen', type: 'string' },
                    { name: 'proj_wvb', type: 'string' },
                    { name: 'tot_uren', type: 'string' },
                    { name: 'bw_kosten', type: 'string' },
                    { name: 'co_kosten', type: 'string' },
                    { name: 'last_kosten', type: 'string' },
                    { name: 'uitbest', type: 'string' },
                    { name: 'tekening', type: 'string' },
                    { name: 'transport', type: 'string' },
                    { name: 'kostprijs', type: 'string' },
                    { name: 'winst', type: 'string' },
                    { name: 'sga', type: 'string' },
                    { name: 'prijs', type: 'string' },
                    { name: 'kg', type: 'string' },
                    { name: 'inh', type: 'string' },
                    { name: 'mtr', type: 'string' }
                ],
           
                id: 'EmployeeID',
                localData: employees
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            // create Tree Grid
            $("#treeGrid").jqxTreeGrid(
            {
                width: 1980,
                source: dataAdapter,
             
                columns: [
				  { text: 'ID', dataField: 'ID', width: 50 },
                  { text: 'Aant', dataField: 'Aant', width: 50 },
                  { text: 'Tekening', dataField: 'Tekening', width: 50 },
                  { text: 'Component', dataField: 'Component', width: 100 },
                  { text: 'Uren', dataField: 'Uren', width: 70 },
                  { text: 'Brut.gew', dataField: 'Brut_gew', width: 50 },
                  { text: 'Net.gew', dataField: 'Net_gew', width: 60 },
                  { text: 'Ver opp.', dataField: 'Ver_opp', width: 50 },
                  { text: 'Inkoop', dataField: 'Inkoop', width: 70 },
                  { text: 'bw', dataField: 'bw', width: 70 },
                  { text: 'br', dataField: 'br', width: 60 },
                  { text: 'wals', dataField: 'wals', width: 70 },
                  { text: 'assemb', dataField: 'assemb', width: 50 },
                  { text: 'lassen', dataField: 'lassen', width: 70 },
                  { text: 'UM-las', dataField: 'uml', width: 70 },
                  { text: 'kotteren', dataField: 'kotteren', width: 50 },
                  { text: 'dr/frezen', dataField: 'dr_frezen', width: 50 },
                  { text: 'proj.wvb', dataField: 'proj_wvb', width: 30 },
                  { text: 'tot.uren', dataField: 'tot_uren', width: 30 },
                  { text: 'bw kosten', dataField: 'bw_kosten', width: 50 },
                  { text: 'co kosten', dataField: 'co_kosten', width: 60 },
                  { text: 'last mat. kosten', dataField: 'last_kosten', width: 50 },
                  { text: 'uitbest. NDO', dataField: 'uitbest', width: 50 },
                  { text: 'uitbet. tekening', dataField: 'tekening', width: 60 },
                  { text: 'uitbest. transport', dataField: 'transport', width: 70 },
                  { text: 'kostprijs', dataField: 'kostprijs', width: 70 },
                  { text: 'winst & risico', dataField: 'winst', width: 70 },
                  { text: 'SGA kosten', dataField: 'sga', width: 80 },
                  { text: 'totaal prijs', dataField: 'prijs', width: 80 }, 
                  { text: 'kilogram prijs', dataField: 'kg', width: 80 },
                  { text: 'las inh. cm3', dataField: 'inh', width: 80 },
                  { text: 'last meters', dataField: 'mtr', width: 80 }
                ]
            });
        });
    </script>
</head>
<body class='default'>
<form method=post action=onderdeel.jsp name=div0>
<h1>Componenten</h1>
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
	    <tr><td>Datum:</td><td><input name=datum  type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"><br></td></tr>
	    <tr><td>Component:</td><td><input name=componentNaam type=text readonly maxlength=30 size=30 value='S-BOCHT' style="background-color:Lavender; color:black;" ></td></tr>
	    <tr><td>Tekeningnummer:</td><td><input name=tekeningnr type=text readonly maxlength=30 size=30 value='F82872' style="background-color:Lavender; color:black;"></td></tr>
 		<tr><td>Aantal:</td><td><input name=aantal type=number min="1" style="background-color:Lavender; color:black; width:30px;" maxlength=2 value='1'></td></tr>
</table>
    <div id="treeGrid">
    </div>
    <tr><td><br><br><br><br><input type=submit value="Voeg onderdeel" class=button4></td>
    <button type="button" onclick="location.href='http://localhost:8080/Megacon2/newComponent.jsp';" class=button4>Voeg component</button></tr>
    </form>
</body>
</html>