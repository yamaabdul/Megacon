
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
	String brg= "Berekende gegevens";
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
animatedcollapse.addDiv('standaardond', 'fade=1,speed=200 ,hide=1')
animatedcollapse.addDiv('dimensie', 'fade=1,speed=200 ,hide=1') 
animatedcollapse.addDiv('standard_dimensie', 'fade=1,speed=200 ,hide=1') 
animatedcollapse.addDiv('romp', 'fade=1,speed=200 ')
animatedcollapse.addDiv('pos', 'fade=1,speed=200 ,hide=1') 
animatedcollapse.addDiv('materiaal', 'fade=1,speed=200 ,hide=1') 
animatedcollapse.addDiv('brgegevens', 'fade=1,speed=200, hide=1') 
animatedcollapse.addDiv('materiaalsoort', 'fade=1,speed=200') 
animatedcollapse.addDiv('brgegevens', 'fade=1,speed=200') 
animatedcollapse.addDiv('div1', 'fade=1,speed=200')  
animatedcollapse.addDiv('wgn', 'fade=0, speed=200')
animatedcollapse.addDiv('las', 'fade=1,speed=200, hide=1') 

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted 
	//$: Access to jQuery 
	//divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID 
	//state: "block" or "none", depending on state 
} 

animatedcollapse.init() 


function Aan(){
	//animatedcollapse.show('div0');
	animatedcollapse.show('romp');
	animatedcollapse.show('dimensie');
	animatedcollapse.show('standard_dimensie');
	animatedcollapse.show('pos');
	animatedcollapse.show('materiaal');
	animatedcollapse.show('div1');
	initStandardonderdeel();
}

function Out(){
	//animatedcollapse.show('div0');
	animatedcollapse.show('brgegevens');
	animatedcollapse.hide('romp');
	animatedcollapse.hide('dimensie');
	animatedcollapse.hide('standard_dimensie');
	animatedcollapse.hide('pos');
	//animatedcollapse.hide('wgn');
}

function initStandardonderdeel(){
//document.div0.romp.checked = true;

}
//add new input type
function add_fields() {
    document.getElementById('wrapper').innerHTML += '<span><tr><td>Lassen:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text"></td>uren</tr></span><br>';
}

function myFunction() {
    var x = document.getElementById('div0');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}

</script>
</head>

<body>
  <h1>Onderdeel</h1><p><br><br>
	    <form method=post action=OnderdeelServlet name=div0>
	    <table>
	    <tr><td></td><td><input name=onderdeel_id type=text hidden maxlength=30 size=30 value='1'></td></tr>
	  <tr><td>Project:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata S-BOCH OXYii' style="background-color:Lavender; color:black;"></td></tr>
		<tr><td>Status:</td> 
			<td>
			<select style="width:242px";>
			  <option value="0">Gecalculeerd</option>
			  <option value="1">Geaccepteerd</option>
			  <option value="2">Geweigerd</option>
			  <option value="3">Geannuleerd</option>
			</select>
		</td></tr>
	    <tr><td>Referentienummer:</td>
	    <td><input name=referentienummer maxlength=6 type=text   maxlength=30 size=30 value='C-4483' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Klant:</td><td><input name=projectNaam type=text  readonly maxlength=30 size=30 value='Tata Steel' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Medewerker:</td><td><input name=medewekerNaam type=text  readonly maxlength=30 size=30 value='<%=user.getMedewerkerNaam()%>' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Datum:</td><td><input name=datum type=text  readonly maxlength=30 size=30 value='<%=timeStamp%>' style="background-color:Lavender; color:black;"><br></td></tr>
	    <tr><td>Component:</td><td><input name=componentNaam type=text readonly maxlength=30 size=30 value='S-BOCHT' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Tekeningnummer:</td><td><input name=tekeningnr type=text readonly maxlength=30 size=30 value='F82872' style="background-color:Lavender; color:black;"></td></tr>
	    <tr><td>Aantal:</td><td><input name=aantal type=number min="1" style="background-color:Lavender; color:black; width:30px;" readonly maxlength=2 value='1'></td> <td></td></tr>
	   <tr><td></td><td><a class="two" href="#" rel="toggle[div0]"><button onclick="myFunction()">Show onderdeel</button></a></td><td><h3><%=brg%></h3></td></tr>
	    <tr>
				<td></td>
				<td>
					 
					<div id=div0>
						<div class="centerwindow2"> <b>Onderdeel</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select name=standaardond onclick="Aan();" style="background-color:Lavender; color:black;">
								<option value=0>ROMP</option>
						
							</select> <br><br>
					
							
						<div id="standard_dimensie" style="width: 700px;">
						Aantal&nbsp;<input name=AH type=number min="1" style="width:30px;" maxlength=10 value='1' >
						Hoog/dia&nbsp;<input name=SH type=number min="0" style="width:70px;" maxlength=20 value='3024'>mm  
						Dikte&nbsp;<input name=SD type=number min="0" style="width:70px;" maxlength=20 value='12'>mm  
						Lengte&nbsp;<input name=SL type=number min="0" style="width:70px;" maxlength=20 value='2300'>mm 
						</div> 
							<br><br> 
						<div id=romp><b>Sub onderdeel</b>&nbsp;&nbsp;<input name=sub type=text style="width:115px;background-color:Lavender; color:black;" maxlength=15 readonly value='Plaat romp'>
						</div> 
						<br>
						<div id="dimensie" style="width: 700px;">
						Aantal&nbsp;<input name=A type=number min="1" style="width:30px;" maxlength=3 value='1'>
						Dikte&nbsp;<input name=D type=number min="0" style="width:70px;" maxlength=20 value='12'>mm 
						Breedte&nbsp;<input name=B type=number min="0" style="width:70px;" maxlength=20 value='2320'>mm 
						Lengte&nbsp;<input name=L type=number min="0" style="width:70px;" maxlength=20 value='9550'>mm 
						</div>
						<br>
								<br> 
						<div id=pos>
								<br>Positie
								<input type=text name=pos style="width:30px;" maxlength=10 value='A'>
						</div> 
				 		<div id=materiaal>	<br>
						<br>Materiaal
						<select style="width:90px;";>
						  <option value="0">S355J2G3</option>
						</select>
						Unit<input name=mu type=text min="0"  style="width:60px;" maxlength=10 value='Euro/Kg'>
						Soortelijk gewicht<input name=ms type=text  style="width:70px;" maxlength=10 value='8,00'>
						Prijs per unit<input name=mp type=textreadonly style="width:70px;" maxlength=10 value='0,90'>
						Certificering<input name=mce type=text  style="width:70px;" maxlength=10 value='3.1 B'>
						</div>	
						</div>
						</div>
						<br><br><br><br><br><br>
						</td>
						<td>
					    <a class="two" href="#" rel="toggle[div1]"><span id=wgn ></span></a>
					    <div id=div1>
						<div class="centerwindow2">
						<div id=brgegevens style="width: 370px;" >
							<table>
						
							<tr>
 							<td>Bruto gewicht:</td><td><input type=text name=brutogewicht readonly maxlength=10 value='2127' style="background-color:Lavender; color:black;">Kg</td>
 							</tr>
 							<tr>
 							<td>Netto gewicht:</td><td><input type=text name=nettogewicht readonly maxlength=10 value='2089,03'style="background-color:Lavender; color:black;">Kg</td>
 							</tr>
 							<tr>
 							<td>Verf opplervlakte:</td><td><input type=text name=verfopp readonly maxlength=10 value='43,7' style="background-color:Lavender; color:black;">m²</td>
 							</tr>
							<tr><td> bw (100):</td> <td><input type=text name=bw maxlength=10 value='1,7'>uren</td></tr>
							<tr>
 							<td>br (110):</td><td><input type=text name=br maxlength=10 value='1,7'>uren</td>
 							</tr>
							<tr>
 							<td>wals (120):</td><td><input type=text name=wals maxlength=10 value='3,2'>uren</td>
 							</tr>
 							<tr>
 							<td>assemb (100):</td><td><input type=text name=assemb maxlength=10  value='13,1'>uren</td>
 							</tr>
<!--  							<tr>
 							<td>lassen (200):</td><td><input type=text name=lassen maxlength=10  value=''></td>
 							</tr>
 							<tr>
 							<td>UM-las (210):</td><td><input type=text name=umlas maxlength=10  value=''></td>
 							</tr>
 							<tr>
 							<td>kotteren (300):</td><td><input type=text name=kotteren maxlength=10  value=''></td>
 							</tr>
 							<tr>
 							<td>dr/frezen (310):</td><td><input type=text name=drfrezen maxlength=10 value=''></td>
 							</tr> -->
 						

 							<tr>
 							<td>proj./wvb (420):</td><td><input type=text name=projectwvb maxlength=10 value='1,4'>uren</td>
 							</tr>
 							
 					<!-- <tr>
 							<td>br. M1 recht:</td><td><input type=text name=brrecht maxlength=10 value='23,7'></td>
 							</tr>
 							<tr>
 							<td>br. M1 schuin:</td><td><input type=text name=brschuin maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>zaaguur:</td><td><input type=text name=zaaguur maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>boor marger:</td><td><input type=text name=boorm maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>boor uur:</td><td><input type=text name=booruur maxlength=10 value=''></td>
 							</tr>
 							 <tr> -->
 	<!-- 					<td>las cat:</td><td><input type=text name=lascat maxlength=10 value='3'></td>
 							</tr>
 							<tr>
 							<td>las 1 type:</td><td><input type=text name=las1 maxlength=10 value=''></td>
 							</tr> -->
<!--  							<tr>
 							<td>las mtr:</td><td><input type=text name=lasmtr1 maxlength=10 value='9,6'></td>
 							</tr>
 							<tr>
 							<td>inh. cm3:</td><td><input type=text name=inh1 maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>las hrs:</td><td><input type=text name=hrs1 maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>las 2 type:</td><td><input type=text name=hrs2 maxlength=10 value=''></td>
 							</tr> -->
 <!--  							<tr>
 							<td>las mtr:</td><td><input type=text name=las2 maxlength=10 value='2,3'></td>
 							</tr>
							<tr>
 							<td>inh. cm3:</td><td><input type=text name=inh2 maxlength=10 value=''></td>
 							</tr>
 							<tr>
 							<td>las hrs:</td><td><input type=text name=hrs2 maxlength=10 value=''></td>
 							</tr> -->
 							<tr>
 							<td>tot. uren:</td><td><input type=text name=toturen maxlength=10 value='21,1'>uren</td>
 							</tr>
 							<tr><td>Voeg een bewerking toe:</td> 
							<td>
							<select name=bewerking onchange="add_fields();"style="width:175px";>
			 			    <option value="0">--maak keuze--</option>
			  				<option value="1">lassen</option>
			  				<option value="2">UM-las</option>
			  				<option value="3">kottereen</option>
			  				<option value="4">dr/frezen</option>
							</select>
							</td></tr>
 							<tr>
							<td>Notitie:</td>
							<td><textarea class=txt rows=3 style="width:168px;" name=notitie></textarea></td>
							</tr>
							
							</table><div class="content" id="wrapper"> </div> 
						</div> </div></div> 
						<br><br><br><br><br></td> 
						
 						 	

							
 		<tr><td></td><td><br><input type=submit value=Opslaan class=button> <input type=reset class=button></td></tr>
</table>
</form>
</body>
</html>
   
	
<%}%>
<jsp:include page="footer.jsp" />
