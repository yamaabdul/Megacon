
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="megacon.util.LyritSettings"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="megacon.dal.*"%>
<%@page import="megacon.dal.Standaard_onderdeel"%>
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
else{ 
	int standaardOnderdeel_id = 0;
	try{standaardOnderdeel_id = Integer.parseInt(request.getParameter("standaardOnderdeel_id"));}
	catch(NumberFormatException numberformatexception) { }
	
	Standaard_onderdeel stn_ond = DAOFactory.getDAOFactory().getStandaard_onderdeelDAO().getStandaard_onderdeel(standaardOnderdeel_id);
	Collection<Standaard_onderdeel> stnOnderdelen =  DAOFactory.getDAOFactory().getStandaard_onderdeelDAO().getStandaard_onderdelen();
	Standaard_onderdeel stnd;
	
	String eol            = "\r\n"; 
	String timeStamp = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(Calendar.getInstance().getTime());
	
out.print(megacon.ui.ShowMenu.show(user.getAccess_level()));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Onderdeel</title>
<script type="text/javascript" src="script/animatedcollapse.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">

animatedcollapse.addDiv('div0', 'fade=1,speed=200,hide=1')
animatedcollapse.addDiv('standaardond', 'fade=1,speed=200')
animatedcollapse.addDiv('dimensie', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('standard_dimensie', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('romp', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('materiaalsoort', 'fade=1,speed=200,hide=1') 
animatedcollapse.addDiv('np', 'fade=1,speed=200,hide=1')

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted 
	//$: Access to jQuery 
	//divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID 
	//state: "block" or "none", depending on state 
} 

animatedcollapse.init() 




function Aan(){
	//animatedcollapse.hide('div0');
	animatedcollapse.show('romp');
	animatedcollapse.show('dimensie');
	animatedcollapse.show('standard_dimensie');
	animatedcollapse.show('pos');
	//animatedcollapse.show('np');
	
}

function myFunction() {
	initButton();
    var x = document.getElementById('div0');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}

function initButton(){
//document.div0.romp.checked = true;
    var x = document.getElementById('np');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}


$(document).ready(function(){
    $("div0").click(function(){
        $("standaardond").slideToggle();
    });
});

</script>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
  <h1>Nieuw onderdeel toevoegen</h1><br><br>
	    <form method=post action=TestServlet name=div0>
	    <table>
	    <tr><td>Project:</td><td><input name=projectNaam type=text readonly maxlength=30 size=30 value='Tata S-BOCH OXYii' style="background-color:Lavender; color:black;"></td></tr>
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
	    <tr><td>Referentienummer:</td>
	    <td><input name=referentienummer maxlength=6 type=text   maxlength=30 size=30 value='C-4483' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Klant:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata Steel' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Datum:</td><td><input name=datum type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"><br></td></tr>
	    <tr><td>Component:</td><td><input name=componentNaam type=text readonly maxlength=30 size=30 value='S-BOCHT' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Tekeningnummer:</td><td><input name=tekeningnr type=text readonly maxlength=30 size=30 value='F82872' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Aantal:</td><td><input name=aantalcp type=number min="1" style="background-color:Lavender; color:black; width:30px;" readonly maxlength=2 value='1'>
	    </td></tr>
	    <tr>
				<td></td><br>
				<td>
					 <a class="two" href="#" rel="toggle[div0]"><button onclick="myFunction()">Kies Standaard onderdeel </button></a>
					<div id="div0">
						<div class="centerwindow2"> <b>Onderdeel</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select name=standaardond onchange="Aan();">
								<option value=0>--maak keuze--</option>
								<%
								
								for(Iterator<Standaard_onderdeel> it = stnOnderdelen.iterator();it.hasNext();){
									stnd = (Standaard_onderdeel)it.next();
									
											
									out.println("<option value=" + stnd.getStandaardOnderdeel_id() + ">" + stnd.getStandaardO_naam() + "</option>");
								}
								%>
							</select> <br><br>
							
						<div id="standard_dimensie" style="width: 700px;">
						Aantal&nbsp;<input name=aantal type=number min="1" required style="width:30px;" maxlength=10 value=''>
						Dikte&nbsp;<input name=dikte type=number min="0" required style="width:70px;" maxlength=20 value=''>mm 
						Breedte&nbsp;<input name=breedte type=number min="0" required style="width:70px;" maxlength=20 value=''>mm 
						Lengte&nbsp;<input name=lengte type=number min="0" required style="width:70px;" maxlength=20 value=''>mm 
						</div> 
						<br><br>
						<div id="dimensie" style="width: 700px;">
						<br><br> 
						<div id=pos>
							<br>Positie
							<input type=text name=pos required style="width:30px;" maxlength=10 value=''>
						</div> 
						<br>
							<br>Materiaal
						<select name=materiaal style="width:90px";>
						  <option value="0">S355J2G3</option>
						  <option value="1">S235JRG2</option>
						  <option value="2">A106B</option>
						  <option value="3">A234WPB</option>
						</select>
						Unit<input name=unit type=text min="0" style="width:60px;" maxlength=10 value='Euro/Kg'>
						Soortelijk gewicht<input name=soortelijkgewicht type=text style="width:70px;" maxlength=10 value='8,00'>
						Prijs per unit<input name=prijs type=text style="width:70px;" maxlength=10 value='0,90'>
						Certificering<input name=certi type=text style="width:70px;" maxlength=10 value='3.1 B'>
						</div>
						<br> 



						 
						</div>
						</div>
						</td>
 						</tr>
						<tr><td></td><td><br><br><br><br><br><br><div id=np><input type=submit value=Toevoegen class=button> <input type=reset class=button></div></td></tr>
 						

</table>
</form>
</body>
</html>
   
	
<%}%>
<jsp:include page="footer.jsp" />
